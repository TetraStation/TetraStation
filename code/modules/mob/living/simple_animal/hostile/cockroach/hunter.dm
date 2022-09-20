
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
