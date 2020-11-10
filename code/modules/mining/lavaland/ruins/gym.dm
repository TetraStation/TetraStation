/obj/structure/punching_bag
	name = "punching bag"
	desc = "A punching bag. Can you get to speed level 4???"
	icon = 'goon/icons/obj/fitness.dmi'
	icon_state = "punchingbag"
	anchored = TRUE
	layer = WALL_OBJ_LAYER
	var/list/hit_sounds = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg',\
	'sound/weapons/punch1.ogg', 'sound/weapons/punch2.ogg', 'sound/weapons/punch3.ogg', 'sound/weapons/punch4.ogg')
	var/obj/item/grenade/grenade // Surprise!
	var/obj/item/reagent_containers/syringe/syringe // Even more Surprise!
	var/slit

/obj/structure/punching_bag/Destroy()
	QDEL_NULL(grenade)
	QDEL_NULL(syringe)
	..()

/obj/structure/punching_bag/attack_hand(mob/user as mob)
	. = ..()
	if(.)
		return
	flick("[icon_state]2", src)
	playsound(loc, pick(hit_sounds), 25, TRUE, -1)
	if(isliving(user))
		var/mob/living/L = user
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "exercise", /datum/mood_event/exercise)
		L.apply_status_effect(STATUS_EFFECT_EXERCISED)
	if(syringe)
		debug_world("Syringe in [src]; [user] hit it.")
		if(!syringe.reagents.total_volume)
			return
		if(user.reagents.total_volume >= user.reagents.maximum_volume)
			return
		var/contained = syringe.reagents.log_list()
		syringe.reagents.trans_to(user, syringe.amount_per_transfer_from_this, methods = INJECT)
		var/turf/bag_turf = get_turf(src)
		user.log_message("hit a hidden syringe ([contained]) in [src.name] at [AREACOORD(bag_turf)].", LOG_ATTACK, \
		color="orange")
		to_chat(user, "<span class='danger'>You feel a sharp prick!</span>")
		return

	if(grenade && !grenade.active)
		log_game("[key_name(user)] activated a hidden grenade in [src].")
		grenade.preprime(user, msg = FALSE, volume = 10)

/obj/structure/punching_bag/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/reagent_containers/syringe))
		if(syringe)
			to_chat(user, "<span class='warning'>[src] already has a syringe!</span>")
			return
		if(grenade)
			to_chat(user, "<span class='danger'>Holy shit, someone's put a grenade in this [src]!</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		user.visible_message("<span class='warning'>[user] slides [I] into [src].</span>", \
		"<span class='danger'>You slide [I] into [src].</span>")
		syringe = I
		var/turf/syringe_turf = get_turf(src)
		log_game("[key_name(user)] added a syringe ([I.name]) to [src] at [AREACOORD(syringe_turf)].")
		return

	if(istype(I, /obj/item/grenade))
		if(grenade)
			to_chat(user, "<span class='warning'>[src] already has a grenade!</span>")
			return
		if(syringe)
			to_chat(user, "<span class='warning'>What the hell, someone's put a syringe in this [src]!</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		user.visible_message("<span class='warning'>[user] slides [I] into [src].</span>", \
		"<span class='danger'>You slide [I] into [src].</span>")
		grenade = I
		var/turf/grenade_turf = get_turf(src)
		log_game("[key_name(user)] added a grenade ([I.name]) to [src] at [AREACOORD(grenade_turf)].")
		return


	if(I.get_sharpness())
		if(grenade)
			to_chat(user, "<span class='notice'>You remove the grenade from [src].</span>")
			user.put_in_hands(grenade)
			grenade = null
			return
		if(syringe)
			to_chat(user, "<span class='notice'>You remove the syringe from [src].</span>")
			user.put_in_hands(syringe)
			syringe = null
			return

		if(!slit)
			to_chat(user, "<span class='notice'>You cut a slit in the [src].</span>")
			slit = TRUE
	return

/obj/structure/weightmachine
	name = "weight machine"
	desc = "Just looking at this thing makes you feel tired."
	density = TRUE
	anchored = TRUE
	var/icon_state_inuse

/obj/structure/weightmachine/proc/AnimateMachine(mob/living/user)
	return

/obj/structure/weightmachine/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(obj_flags & IN_USE)
		to_chat(user, "<span class='warning'>It's already in use - wait a bit!</span>")
		return
	else
		obj_flags |= IN_USE
		icon_state = icon_state_inuse
		user.setDir(SOUTH)
		user.Stun(80)
		user.forceMove(src.loc)
		var/bragmessage = pick("pushing it to the limit","going into overdrive","burning with determination","rising up to the challenge", "getting strong now","getting ripped")
		user.visible_message("<B>[user] is [bragmessage]!</B>")
		AnimateMachine(user)

		playsound(user, 'sound/machines/click.ogg', 60, TRUE)
		obj_flags &= ~IN_USE
		user.pixel_y = 0
		var/finishmessage = pick("You feel stronger!","You feel like you can take on the world!","You feel robust!","You feel indestructible!")
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "exercise", /datum/mood_event/exercise)
		icon_state = initial(icon_state)
		to_chat(user, finishmessage)
		user.apply_status_effect(STATUS_EFFECT_EXERCISED)

/obj/structure/weightmachine/stacklifter
	icon = 'goon/icons/obj/fitness.dmi'
	icon_state = "fitnesslifter"
	icon_state_inuse = "fitnesslifter2"

/obj/structure/weightmachine/stacklifter/AnimateMachine(mob/living/user)
	var/lifts = 0
	while (lifts++ < 6)
		if (user.loc != src.loc)
			break
		sleep(3)
		animate(user, pixel_y = -2, time = 3)
		sleep(3)
		animate(user, pixel_y = -4, time = 3)
		sleep(3)
		playsound(user, 'goon/sound/effects/spring.ogg', 60, TRUE)

/obj/structure/weightmachine/weightlifter
	icon = 'goon/icons/obj/fitness.dmi'
	icon_state = "fitnessweight"
	icon_state_inuse = "fitnessweight-c"

/obj/structure/weightmachine/weightlifter/AnimateMachine(mob/living/user)
	var/mutable_appearance/swole_overlay = mutable_appearance(icon, "fitnessweight-w", WALL_OBJ_LAYER)
	add_overlay(swole_overlay)
	var/reps = 0
	user.pixel_y = 5
	while (reps++ < 6)
		if (user.loc != src.loc)
			break
		for (var/innerReps = max(reps, 1), innerReps > 0, innerReps--)
			sleep(3)
			animate(user, pixel_y = (user.pixel_y == 3) ? 5 : 3, time = 3)
		playsound(user, 'goon/sound/effects/spring.ogg', 60, TRUE)
	sleep(3)
	animate(user, pixel_y = 2, time = 3)
	sleep(3)
	cut_overlay(swole_overlay)
