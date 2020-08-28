
//Apprenticeship contract - moved to antag_spawner.dm

///////////////////////////Veil Render//////////////////////

/obj/item/veilrender
	name = "veil render"
	desc = "A wicked curved blade of alien origin, recovered from the ruins of a vast city."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	inhand_icon_state = "knife"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	force = 15
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/charges = 1
	var/spawn_type = /obj/singularity/wizard
	var/spawn_amt = 1
	var/activate_descriptor = "reality"
	var/rend_desc = "You should run now."
	var/spawn_fast = FALSE //if TRUE, ignores checking for mobs on loc before spawning

/obj/item/veilrender/attack_self(mob/user)
	if(charges > 0)
		new /obj/effect/rend(get_turf(user), spawn_type, spawn_amt, rend_desc, spawn_fast)
		charges--
		user.visible_message("<span class='boldannounce'>[src] hums with power as [user] deals a blow to [activate_descriptor] itself!</span>")
	else
		to_chat(user, "<span class='danger'>The unearthly energies that powered the blade are now dormant.</span>")

/obj/effect/rend
	name = "tear in the fabric of reality"
	desc = "You should run now."
	icon = 'icons/effects/effects.dmi'
	icon_state = "rift"
	density = TRUE
	anchored = TRUE
	var/spawn_path = /mob/living/simple_animal/cow //defaulty cows to prevent unintentional narsies
	var/spawn_amt_left = 20
	var/spawn_fast = FALSE

/obj/effect/rend/New(loc, spawn_type, spawn_amt, desc, spawn_fast)
	src.spawn_path = spawn_type
	src.spawn_amt_left = spawn_amt
	src.desc = desc
	src.spawn_fast = spawn_fast
	START_PROCESSING(SSobj, src)
	return

/obj/effect/rend/process()
	if(!spawn_fast)
		if(locate(/mob) in loc)
			return
	new spawn_path(loc)
	spawn_amt_left--
	if(spawn_amt_left <= 0)
		qdel(src)

/obj/effect/rend/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/nullrod))
		user.visible_message("<span class='danger'>[user] seals \the [src] with \the [I].</span>")
		qdel(src)
		return
	else
		return ..()

/obj/effect/rend/singularity_act()
	return

/obj/effect/rend/singularity_pull()
	return

/obj/item/veilrender/vealrender
	name = "veal render"
	desc = "A wicked curved blade of alien origin, recovered from the ruins of a vast farm."
	spawn_type = /mob/living/simple_animal/cow
	spawn_amt = 20
	activate_descriptor = "hunger"
	rend_desc = "Reverberates with the sound of ten thousand moos."

/obj/item/veilrender/honkrender
	name = "honk render"
	desc = "A wicked curved blade of alien origin, recovered from the ruins of a vast circus."
	spawn_type = /mob/living/simple_animal/hostile/retaliate/clown
	spawn_amt = 10
	activate_descriptor = "depression"
	rend_desc = "Gently wafting with the sounds of endless laughter."
	icon_state = "clownrender"

/obj/item/veilrender/honkrender/honkhulkrender
	name = "superior honk render"
	desc = "A wicked curved blade of alien origin, recovered from the ruins of a vast circus. This one gleams with a special light."
	spawn_type = /mob/living/simple_animal/hostile/retaliate/clown/clownhulk
	spawn_amt = 5
	activate_descriptor = "depression"
	rend_desc = "Gently wafting with the sounds of mirthful grunting."
	icon_state = "clownrender"

////TEAR IN REALITY

/obj/singularity/wizard
	name = "tear in the fabric of reality"
	desc = "This isn't right."
	icon = 'icons/effects/224x224.dmi'
	icon_state = "reality"
	pixel_x = -96
	pixel_y = -96
	dissipate = 0
	move_self = 0
	consume_range = 3
	grav_pull = 4
	current_size = STAGE_FOUR
	allowed_size = STAGE_FOUR

/obj/singularity/wizard/process()
	move()
	eat()
	return

/obj/singularity/wizard/attack_tk(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/datum/component/mood/insaneinthemembrane = C.GetComponent(/datum/component/mood)
		if(insaneinthemembrane.sanity < 15)
			return //they've already seen it and are about to die, or are just too insane to care
		to_chat(C, "<span class='userdanger'>OH GOD! NONE OF IT IS REAL! NONE OF IT IS REEEEEEEEEEEEEEEEEEEEEEEEAL!</span>")
		insaneinthemembrane.sanity = 0
		for(var/lore in typesof(/datum/brain_trauma/severe))
			C.gain_trauma(lore)
		addtimer(CALLBACK(src, /obj/singularity/wizard.proc/deranged, C), 100)

/obj/singularity/wizard/proc/deranged(mob/living/carbon/C)
	if(!C || C.stat == DEAD)
		return
	C.vomit(0, TRUE, TRUE, 3, TRUE)
	C.spew_organ(3, 2)
	C.death()

/obj/singularity/wizard/mapped/admin_investigate_setup()
	return

/////////////////////////////////////////Scrying///////////////////

/obj/item/scrying
	name = "scrying orb"
	desc = "An incandescent orb of otherworldly energy, merely holding it gives you vision and hearing beyond mortal means, and staring into it lets you see the entire universe."
	icon = 'icons/obj/projectiles.dmi'
	icon_state ="bluespace"
	throw_speed = 3
	throw_range = 7
	throwforce = 15
	damtype = BURN
	force = 15
	hitsound = 'sound/items/welder2.ogg'

	var/mob/current_owner

/obj/item/scrying/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/scrying/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/scrying/process()
	var/mob/holder = get(loc, /mob)
	if(current_owner && current_owner != holder)

		to_chat(current_owner, "<span class='notice'>Your otherworldly vision fades...</span>")

		REMOVE_TRAIT(current_owner, TRAIT_SIXTHSENSE, SCRYING_ORB)
		REMOVE_TRAIT(current_owner, TRAIT_XRAY_VISION, SCRYING_ORB)
		current_owner.update_sight()

		current_owner = null

	if(!current_owner && holder)
		current_owner = holder

		to_chat(current_owner, "<span class='notice'>You can see...everything!</span>")

		ADD_TRAIT(current_owner, TRAIT_SIXTHSENSE, SCRYING_ORB)
		ADD_TRAIT(current_owner, TRAIT_XRAY_VISION, SCRYING_ORB)
		current_owner.update_sight()

/obj/item/scrying/attack_self(mob/user)
	visible_message("<span class='danger'>[user] stares into [src], their eyes glazing over.</span>")
	user.ghostize(1)

/////////////////////////////////////////Necromantic Stone///////////////////

/obj/item/necromantic_stone
	name = "necromantic stone"
	desc = "A shard capable of resurrecting humans as skeleton thralls."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "necrostone"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/list/spooky_scaries = list()
	var/unlimited = 0

/obj/item/necromantic_stone/unlimited
	unlimited = 1

/obj/item/necromantic_stone/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(!istype(M))
		return ..()

	if(!istype(user) || !user.canUseTopic(M, BE_CLOSE))
		return

	if(M.stat != DEAD)
		to_chat(user, "<span class='warning'>This artifact can only affect the dead!</span>")
		return

	for(var/mob/dead/observer/ghost in GLOB.dead_mob_list) //excludes new players
		if(ghost.mind && ghost.mind.current == M && ghost.client)  //the dead mobs list can contain clientless mobs
			ghost.reenter_corpse()
			break

	if(!M.mind || !M.client)
		to_chat(user, "<span class='warning'>There is no soul connected to this body...</span>")
		return

	check_spooky()//clean out/refresh the list
	if(spooky_scaries.len >= 3 && !unlimited)
		to_chat(user, "<span class='warning'>This artifact can only affect three undead at a time!</span>")
		return

	M.set_species(/datum/species/skeleton, icon_update=0)
	M.revive(full_heal = TRUE, admin_revive = TRUE)
	spooky_scaries |= M
	to_chat(M, "<span class='userdanger'>You have been revived by </span><B>[user.real_name]!</B>")
	to_chat(M, "<span class='userdanger'>[user.p_theyre(TRUE)] your master now, assist [user.p_them()] even if it costs you your new life!</span>")

	equip_roman_skeleton(M)

	desc = "A shard capable of resurrecting humans as skeleton thralls[unlimited ? "." : ", [spooky_scaries.len]/3 active thralls."]"

/obj/item/necromantic_stone/proc/check_spooky()
	if(unlimited) //no point, the list isn't used.
		return

	for(var/X in spooky_scaries)
		if(!ishuman(X))
			spooky_scaries.Remove(X)
			continue
		var/mob/living/carbon/human/H = X
		if(H.stat == DEAD)
			H.dust(TRUE)
			spooky_scaries.Remove(X)
			continue
	listclearnulls(spooky_scaries)

//Funny gimmick, skeletons always seem to wear roman/ancient armour
/obj/item/necromantic_stone/proc/equip_roman_skeleton(mob/living/carbon/human/H)
	for(var/obj/item/I in H)
		H.dropItemToGround(I)

	var/hat = pick(/obj/item/clothing/head/helmet/roman, /obj/item/clothing/head/helmet/roman/legionnaire)
	H.equip_to_slot_or_del(new hat(H), ITEM_SLOT_HEAD)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/costume/roman(H), ITEM_SLOT_ICLOTHING)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/roman(H), ITEM_SLOT_FEET)
	H.put_in_hands(new /obj/item/shield/riot/roman(H), TRUE)
	H.put_in_hands(new /obj/item/claymore(H), TRUE)
	H.equip_to_slot_or_del(new /obj/item/spear(H), ITEM_SLOT_BACK)

//Provides a decent heal, need to pump every 6 seconds
/obj/item/organ/heart/cursed/wizard
	pump_delay = 60
	heal_brute = 25
	heal_burn = 25
	heal_oxy = 25

//Warp Whistle: Provides uncontrolled long distance teleportation.

/obj/item/warpwhistle
	name = "warp whistle"
	desc = "One toot on this whistle will send you to a far away land!"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "whistle"
	var/on_cooldown = 0 //0: usable, 1: in use, 2: on cooldown
	var/mob/living/carbon/last_user

/obj/item/warpwhistle/proc/interrupted(mob/living/carbon/user)
	if(!user || QDELETED(src) || user.notransform)
		on_cooldown = FALSE
		return TRUE
	return FALSE

/obj/item/warpwhistle/proc/end_effect(mob/living/carbon/user)
	user.invisibility = initial(user.invisibility)
	user.status_flags &= ~GODMODE
	user.update_mobility()

/obj/item/warpwhistle/attack_self(mob/living/carbon/user)
	if(!istype(user) || on_cooldown)
		return
	on_cooldown = TRUE
	last_user = user
	var/turf/T = get_turf(user)
	playsound(T,'sound/magic/warpwhistle.ogg', 200, TRUE)
	user.mobility_flags &= ~MOBILITY_MOVE
	new /obj/effect/temp_visual/tornado(T)
	sleep(20)
	if(interrupted(user))
		return
	user.invisibility = INVISIBILITY_MAXIMUM
	user.status_flags |= GODMODE
	sleep(20)
	if(interrupted(user))
		end_effect(user)
		return
	var/breakout = 0
	while(breakout < 50)
		var/turf/potential_T = find_safe_turf()
		if(T.z != potential_T.z || abs(get_dist_euclidian(potential_T,T)) > 50 - breakout)
			do_teleport(user, potential_T, channel = TELEPORT_CHANNEL_MAGIC)
			user.mobility_flags &= ~MOBILITY_MOVE
			T = potential_T
			break
		breakout += 1
	new /obj/effect/temp_visual/tornado(T)
	sleep(20)
	end_effect(user)
	if(interrupted(user))
		return
	on_cooldown = 2
	addtimer(VARSET_CALLBACK(src, on_cooldown, 0), 4 SECONDS)

/obj/item/warpwhistle/Destroy()
	if(on_cooldown == 1 && last_user) //Flute got dunked somewhere in the teleport
		end_effect(last_user)
	return ..()

/obj/effect/temp_visual/tornado
	icon = 'icons/obj/wizard.dmi'
	icon_state = "tornado"
	name = "tornado"
	desc = "This thing sucks!"
	layer = FLY_LAYER
	randomdir = 0
	duration = 40
	pixel_x = 500

/obj/effect/temp_visual/tornado/Initialize()
	. = ..()
	animate(src, pixel_x = -500, time = 40)
