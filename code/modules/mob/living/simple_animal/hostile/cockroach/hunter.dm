
// ********** Hunter **********
/mob/living/simple_animal/hostile/cockroach/hunter
	name = "Hunteroach"
	desc = "A worryingly quick cockroach with large claws"
	icon_state = "hunteroach"
	icon_dead = "hunteroach_dead"
	mob_size = MOB_SIZE_HUMAN
	health = 50            // Not as strong as the tank
	speed = -2             // But faster
	melee_damage_lower = 8 // And does more damage
	melee_damage_upper = 16
	wound_bonus = FLESH_WOUND // 'tis but a...
	bare_wound_bonus = 2
	sharpness = SHARP_EDGED
	faction = list("roach")

	dodging = TRUE
	retreat_distance = 3
	robust_searching = TRUE
	vision_range = 9
	aggro_vision_range = 12
	stat_attack = HARD_CRIT
	lose_patience_timeout = 45 SECONDS

/mob/living/simple_animal/hostile/MoveToTarget(list/possible_targets)
	stop_automated_movement = 1
	if(!target || !CanAttack(target))
		LoseTarget()
		return 0

	if(target in possible_targets)
		var/turf/T = get_turf(src)
		if(target.z != T.z)
			LoseTarget()
			return 0

		if(!Process_Spacemove()) /* Check we're not in space */
			walk(src, 0)
			return 1

		Goto(target, move_to_delay, minimum_distance)

		if(targets_from && isturf(targets_from.loc) && target.Adjacent(targets_from))
			MeleeAction()		// Hit
			if(retreat_distance)	// n Run
				walk_away(src, target, retreat_distance, move_to_delay)
		return 0
	if(target.loc != null && get_dist(targets_from, target.loc) <= vision_range)
		// We can't see 'em, but they're still in our vision range!
		if(FindHidden())
			return 1
	LoseTarget()
	return 0
