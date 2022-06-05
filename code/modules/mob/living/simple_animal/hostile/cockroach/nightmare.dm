// Welcome to the cockroach-y nightmare!

// ********** Tankroach **********
/mob/living/simple_animal/hostile/cockroach/tank
	name = "tankroach"
	desc = "A distressingly-robust looking cockroach the size of a dog."
	icon_state = "roachtank"
	icon_dead = "roachtank_dead"
	health = 45
	mob_size = MOB_SIZE_HUMAN
	// Hits like goddamn
	melee_damage_lower = 7
	melee_damage_upper = 16
	// But slow
	speed = 4


/mob/living/simple_animal/hostile/cockroach/tank/slip()
	// No slip 4 u. hi traction tankroach
	return FALSE


// ********** Hunter **********
/mob/living/simple_animal/hostile/cockroach/hunter
	name = "Hunteroach"
	desc = "A worryingly quick cockroach with large claws"
	icon_state = "hunteroach"
	icon_dead = "hunteroach_dead"
	mob_size = MOB_SIZE_HUMAN
	health = 15            // Less health than a giant cockroach
	speed = -2             // But faster
	melee_damage_lower = 8 // And does more damage
	melee_damage_upper = 16
	wound_bonus = FLESH_WOUND // 'tis but a...
	bare_wound_bonus = 2
	sharpness = SHARP_EDGED

