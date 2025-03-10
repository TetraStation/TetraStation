/**
  * This is the proc that handles the order of an item_attack.
  *
  * The order of procs called is:
  * * [/atom/proc/tool_act] on the target. If it returns TRUE, the chain will be stopped.
  * * [/obj/item/proc/pre_attack] on src. If this returns TRUE, the chain will be stopped.
  * * [/atom/proc/attackby] on the target. If it returns TRUE, the chain will be stopped.
  * * [/obj/item/proc/afterattack]. The return value does not matter.
  */
/obj/item/proc/melee_attack_chain(mob/user, atom/target, params)

	var/is_right_clicking = LAZYACCESS(params2list(params), RIGHT_CLICK)

	if(tool_behaviour && target.tool_act(user, src, tool_behaviour))
		return
	if(pre_attack(target, user, params))
		return
	var/attackby_result

	if (is_right_clicking)
		switch (target.attackby_alt(src, user, params))
			if (ALT_ATTACK_CALL_NORMAL)
				attackby_result = target.attackby(src, user, params)
			if (ALT_ATTACK_CANCEL_ATTACK_CHAIN)
				return TRUE
			if (null)
				CRASH("attackby_alt must return an ALT_ATTACK_* define, please consult code/__DEFINES/combat.dm")
	else
		attackby_result = target.attackby(src, user, params)

	if (attackby_result)
		return

	if(QDELETED(src) || QDELETED(target))
		attack_qdeleted(target, user, TRUE, params)
		return

	if (is_right_clicking)
		var/after_attack_alt_result = afterattack_alt(target, user, TRUE, params)

		// There's no chain left to continue at this point, so CANCEL_ATTACK_CHAIN and CONTINUE_CHAIN are functionally the same.
		if (after_attack_alt_result == ALT_ATTACK_CANCEL_ATTACK_CHAIN || after_attack_alt_result == ALT_ATTACK_CONTINUE_CHAIN)
			return TRUE

	afterattack(target, user, TRUE, params)

/// Called when the item is in the active hand, and clicked; alternately, there is an 'activate held object' verb or you can hit pagedown.
/obj/item/proc/attack_self(mob/user)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_SELF, user) & COMPONENT_NO_INTERACT)
		return
	interact(user)

/**
  * Called on the item before it hits something
  *
  * Arguments:
  * * atom/A - The atom about to be hit
  * * mob/living/user - The mob doing the htting
  * * params - click params such as alt/shift etc
  *
  * See: [/obj/item/proc/melee_attack_chain]
  */
/obj/item/proc/pre_attack(atom/A, mob/living/user, params) //do stuff before attackby!
	if(SEND_SIGNAL(src, COMSIG_ITEM_PRE_ATTACK, A, user, params) & COMPONENT_NO_ATTACK)
		return TRUE
	return FALSE //return TRUE to avoid calling attackby after this proc does stuff

/**
  * Called on an object being hit by an item
  *
  * Arguments:
  * * obj/item/W - The item hitting this atom
  * * mob/user - The wielder of this item
  * * params - click params such as alt/shift etc
  *
  * See: [/obj/item/proc/melee_attack_chain]
  */
/atom/proc/attackby(obj/item/W, mob/user, params)
	if(SEND_SIGNAL(src, COMSIG_PARENT_ATTACKBY, W, user, params) & COMPONENT_NO_AFTERATTACK)
		return TRUE
	return FALSE

/**
 * Called on an object being right-clicked on by an item
 *
 * Arguments:
 * * obj/item/weapon - The item hitting this atom
 * * mob/user - The wielder of this item
 * * params - click params such as alt/shift etc
 *
 * See: [/obj/item/proc/melee_attack_chain]
 */
/atom/proc/attackby_alt(obj/item/weapon, mob/user, params)
	return ALT_ATTACK_CALL_NORMAL

/obj/attackby(obj/item/I, mob/living/user, params)
	return ..() || ((obj_flags & CAN_BE_HIT) && I.attack_obj(src, user))

/mob/living/attackby(obj/item/I, mob/living/user, params)
	if(..())
		return TRUE
	user.changeNext_move(CLICK_CD_MELEE)
	return I.attack(src, user)

/mob/living/attackby_alt(obj/item/weapon, mob/living/user, params)
	var/result = weapon.attack_alt(src, user, params)

	// Normal attackby updates click cooldown, so we have to make up for it
	if (result != ALT_ATTACK_CALL_NORMAL)
		user.changeNext_move(CLICK_CD_MELEE)

	return result

/**
  * Called from [/mob/living/attackby]
  *
  * Arguments:
  * * mob/living/M - The mob being hit by this item
  * * mob/living/user - The mob hitting with this item
  */
/obj/item/proc/attack(mob/living/M, mob/living/user)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK, M, user) & COMPONENT_ITEM_NO_ATTACK)
		return
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK, M, user)
	if(item_flags & NOBLUDGEON)
		return

	if(force && HAS_TRAIT(user, TRAIT_PACIFISM))
		to_chat(user, "<span class='warning'>You don't want to harm other living beings!</span>")
		return

	if(item_flags & EYE_STAB && user.zone_selected == BODY_ZONE_PRECISE_EYES)
		if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
			M = user
		if(eyestab(M,user))
			return
	if(!force)
		playsound(loc, 'sound/weapons/tap.ogg', get_clamped_volume(), TRUE, -1)
	else if(hitsound)
		playsound(loc, hitsound, get_clamped_volume(), TRUE, -1)

	M.lastattacker = user.real_name
	M.lastattackerckey = user.ckey

	if(force && M == user && user.client)
		user.client.give_award(/datum/award/achievement/misc/selfouch, user)

	user.do_attack_animation(M)
	M.attacked_by(src, user)

	log_combat(user, M, "attacked", src.name, "(INTENT: [uppertext(user.a_intent)]) (DAMTYPE: [uppertext(damtype)])")
	add_fingerprint(user)

/// The equivalent of [/obj/item/proc/attack] but for alternate attacks, AKA right clicking
/obj/item/proc/attack_alt(mob/living/victim, mob/living/user, params)
	return ALT_ATTACK_CALL_NORMAL


/// The equivalent of the standard version of [/obj/item/proc/attack] but for object targets.
/obj/item/proc/attack_obj(obj/O, mob/living/user)
	if(SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_OBJ, O, user) & COMPONENT_NO_ATTACK_OBJ)
		return
	if(item_flags & NOBLUDGEON)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	user.do_attack_animation(O)
	O.attacked_by(src, user)

/// Called from [/obj/item/proc/attack_obj] and [/obj/item/proc/attack] if the attack succeeds
/atom/movable/proc/attacked_by()
	return

/obj/attacked_by(obj/item/I, mob/living/user)
	if(I.force)
		user.visible_message("<span class='danger'>[user] hits [src] with [I]!</span>", \
					"<span class='danger'>You hit [src] with [I]!</span>", null, COMBAT_MESSAGE_RANGE)
		//only witnesses close by and the victim see a hit message.
		log_combat(user, src, "attacked", I)
	take_damage(I.force, I.damtype, "melee", 1)

/mob/living/attacked_by(obj/item/I, mob/living/user)
	send_item_attack_message(I, user)
	if(I.force)
		apply_damage(I.force, I.damtype)
		if(I.damtype == BRUTE)
			if(prob(33))
				I.add_mob_blood(src)
				var/turf/location = get_turf(src)
				add_splatter_floor(location)
				if(get_dist(user, src) <= 1)	//people with TK won't get smeared with blood
					user.add_mob_blood(src)
		return TRUE //successful attack

/mob/living/simple_animal/attacked_by(obj/item/I, mob/living/user)
	if(I.force < force_threshold || I.damtype == STAMINA)
		playsound(loc, 'sound/weapons/tap.ogg', I.get_clamped_volume(), TRUE, -1)
	else
		return ..()

/**
  * Last proc in the [/obj/item/proc/melee_attack_chain]
  *
  * Arguments:
  * * atom/target - The thing that was hit
  * * mob/user - The mob doing the hitting
  * * proximity_flag - is 1 if this afterattack was called on something adjacent, in your square, or on your person.
  * * click_parameters - is the params string from byond [/atom/proc/Click] code, see that documentation.
  */
/obj/item/proc/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	SEND_SIGNAL(src, COMSIG_ITEM_AFTERATTACK, target, user, proximity_flag, click_parameters)
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_AFTERATTACK, target, user, proximity_flag, click_parameters)

/**
 * Called at the end of the attack chain if the user right-clicked.
 *
 * Arguments:
 * * atom/target - The thing that was hit
 * * mob/user - The mob doing the hitting
 * * proximity_flag - is 1 if this afterattack was called on something adjacent, in your square, or on your person.
 * * click_parameters - is the params string from byond [/atom/proc/Click] code, see that documentation.
 */
/obj/item/proc/afterattack_alt(atom/target, mob/user, proximity_flag, click_parameters)
	return ALT_ATTACK_CALL_NORMAL

/// Called if the target gets deleted by our attack
/obj/item/proc/attack_qdeleted(atom/target, mob/user, proximity_flag, click_parameters)
	SEND_SIGNAL(src, COMSIG_ITEM_ATTACK_QDELETED, target, user, proximity_flag, click_parameters)
	SEND_SIGNAL(user, COMSIG_MOB_ITEM_ATTACK_QDELETED, target, user, proximity_flag, click_parameters)

/obj/item/proc/get_clamped_volume()
	if(w_class)
		if(force)
			return clamp((force + w_class) * 4, 30, 100)// Add the item's force to its weight class and multiply by 4, then clamp the value between 30 and 100
		else
			return clamp(w_class * 6, 10, 100) // Multiply the item's weight class by 6, then clamp the value between 10 and 100

/mob/living/proc/send_item_attack_message(obj/item/I, mob/living/user, hit_area, obj/item/bodypart/hit_bodypart)
	var/message_verb_continuous = length(I.attack_verb_continuous) ? "[pick(I.attack_verb_continuous)]" : "attacks"
	var/message_verb_simple = length(I.attack_verb_simple) ? "[pick(I.attack_verb_simple)]" : "attack"
	if(!I.force)
		return
	var/message_hit_area = ""
	if(hit_area)
		message_hit_area = " in the [hit_area]"
	var/attack_message_spectator = "[src] [message_verb_continuous][message_hit_area] with [I]!"
	var/attack_message_victim = "You're [message_verb_continuous][message_hit_area] with [I]!"
	var/attack_message_attacker = "You [message_verb_simple] [src][message_hit_area] with [I]!"
	if(user in viewers(src, null))
		attack_message_spectator = "[user] [message_verb_continuous] [src][message_hit_area] with [I]!"
		attack_message_victim = "[user] [message_verb_continuous] you[message_hit_area] with [I]!"
	if(user == src)
		attack_message_victim = "You [message_verb_simple] yourself[message_hit_area] with [I]"
	visible_message("<span class='danger'>[attack_message_spectator]</span>",\
		"<span class='userdanger'>[attack_message_victim]</span>", null, COMBAT_MESSAGE_RANGE, user)
	to_chat(user, "<span class='danger'>[attack_message_attacker]</span>")
	return 1
