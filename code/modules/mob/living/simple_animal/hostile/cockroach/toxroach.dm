// Plasma-spewing fart-bug roach
/mob/living/simple_animal/hostile/cockroach/toxroach
	name = "Toxroach"
	desc = "A fat, squat purple cockroach that ... farts plasma. Sure, why not."
	icon_state = "fartroach"
	icon_dead  = "fartroach_dead"
	mob_size   = MOB_SIZE_HUMAN
	health     = 50
	maxHealth  = 50
	speed = 4
	melee_damage_lower = 2
	melee_damage_upper = 4
	faction = list("roach")

	/* Assblast roach. We're area-denial, so try to avoid getting into
	melee range. We don't need to worry about friendly fire. */
	ranged = TRUE
	ranged_cooldown_time = 10 SECONDS
	ranged_ignores_vision = TRUE
	check_friendly_fire = FALSE
	retreat_distance = 3
	minimum_distance = 6

	// Moles of plasma released occasionally by a living toxroach
	var/assvape_amount_lower = 5
	var/assvape_amount_upper = 15

	// Moles of plasma released on attack.
	var/assblast_amount_lower = 80
	var/assblast_amount_upper = 100

	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0,\
				"min_tox" = 0, "max_tox" = 0,  \
				"min_co2" = 0, "max_co2" = 15,  \
				"min_n2" = 0,  "max_n2" = 0)

/mob/living/simple_animal/hostile/cockroach/toxroach/Life()
	if(prob(1))
		var/list/cached_gases
		var/datum/gas_mixture/air

		if(isturf(src.loc))
			air = src.return_air()
			cached_gases = air?.gases
			if(cached_gases)
				ASSERT_GAS(/datum/gas/plasma, air)
				cached_gases[/datum/gas/plasma][MOLES] += rand(src.assvape_amount_lower, src.assvape_amount_upper)
	. = ..()

/mob/living/simple_animal/hostile/cockroach/toxroach/OpenFire(atom/A)
	/* Plasma fart. A plart, if you will. */
	var/list/cached_gases
	var/datum/gas_mixture/air

	if(isturf(src.loc))
		air = src.return_air()
		cached_gases = air?.gases
		if(cached_gases)
			ASSERT_GAS(/datum/gas/plasma, air)
			cached_gases[/datum/gas/plasma][MOLES] += rand(src.assblast_amount_lower, src.assblast_amount_upper)

	ranged_cooldown = world.time + ranged_cooldown_time


/mob/living/simple_animal/hostile/cockroach/toxroach/MoveToTarget(list/possible_targets)
	stop_automated_movement = 1

	if(!target || !CanAttack(target))
		LoseTarget()
		return 0
	if(target in possible_targets)
		var/turf/T = get_turf(src)
		if(target.z != T.z)
			LoseTarget()
			return 0

		var/target_distance = get_dist(targets_from, target)
		if(ranged_cooldown <= world.time && target_distance <= src.minimum_distance)
			if(!(simple_mob_flags & SILENCE_RANGED_MESSAGE))
				visible_message("<span class='danger'><b>[src]</b> releases a plume!</span>")
			src.OpenFire(target) // Poot!

		if(!Process_Spacemove())
			// Just driftin'
			walk(src, 0)
			return 1

		// Stay within our minimum distance
		if(target_distance <= retreat_distance)
			walk_away(src, target, retreat_distance, move_to_delay)
		else
			Goto(target, move_to_delay, minimum_distance)

		if(targets_from && isturf(targets_from.loc) && target.Adjacent(targets_from))
			MeleeAction() // Give 'em a smack!
			return 1
		else
			in_melee = FALSE

		if(target.loc != null && get_dist(targets_from, target.loc) <= vision_range)
			// We can't see 'em, but they're still within visual range.
			if(ranged_cooldown <= world.time && prob(25))
				if(!(simple_mob_flags & SILENCE_RANGED_MESSAGE))
					visible_message("<span class='danger'><b>[src]</b> releases a plume!</span>")
				src.OpenFire(target) // Fire anyway, deny the area.
			return 1

		LoseTarget()
		return 0
