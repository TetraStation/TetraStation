// The big roach that makes all da rules
/mob/living/simple_animal/hostile/cockroach/king
	name = "King roach"
	desc = "Da big roach that makes all da rules"
	icon_state = "kingroach"
	faction = list("roach")

	turns_per_move = 4
	maxHealth = 150
	health = 150

	melee_damage_lower = 12
	melee_damage_upper = 25
	obj_damage = 5
	armour_penetration = 20

	mob_size = MOB_SIZE_LARGE

	var/distress_level = 0
	var/distress_calls = 1 // Can only call for help once in its life, much like my father.
	var/retreat_calls  = 1 // Can also only call for a retreat once.

/mob/living/simple_animal/hostile/cockroach/king/bullet_act()
	. = ..()
	distress_call()

/mob/living/simple_animal/hostile/cockroach/king/attackby()
	. = ..()
	distress_call()

/mob/living/simple_animal/hostile/cockroach/king/proc/distress_call()
	/* When its subordinates die, the king roach may call for
	aid. It may also call when it, personally, is under attack.

	Every nearby roach death, or attack on the king, increases the
	chance of a distress call being sent out.

	If I ever get around to putting the burrows stuff in, a
	distress call will request rapid reinforcements from nearby
	burrows, which will result in a potentially significant number
	of roaches charging in.

	Each king roach can only call reinforcements once in its
	life. Likewise, it can only sound the call for an evacuation
	once. If it has no reinforcements left, it will attempt to
	evacuate. */
	if(!distress_calls && !retreat_calls)
		return // Ye had yer chance already!

	distress_level += 1

	// If a player has managed to get close enough to the king to
	// be able to see it, add more distress.
	for(var/mob/living/carbon/human/H in view())
		if(H.stat != DEAD && H.client)
			distress_level += 2
			break

	if (distress_level >0 && prob(distress_level))
		if(distress_calls)
			distress_calls--
			spawn(2) // Playing the sound twice makes it sound extra horrible!
				playsound(src.loc, 'sound/voice/hiss1.ogg', 100, 1, 8, 8)

			visible_message("<span class='danger'>[src] emits a horrifying hiss!</span>")
			// At this point, we'd set all the nearby burrows to distress mode, if we had any!

		else if(retreat_calls)
			retreat_calls --
			spawn(2)
				playsound(src.loc, 'sound/voice/moth/scream_moth.ogg', 100, 1, 8, 8)

			visible_message("<span class='warning'>[src] emits a haunting scream!</span>")
			// And here, we'd set all the nearby burrows to evacuate mode.

/mob/living/simple_animal/hostile/cockroach/king/slip(var/slipped_on_stun_duration=8)
	return FALSE // High traction roach.
