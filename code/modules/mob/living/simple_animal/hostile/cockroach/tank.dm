// Welcome to the cockroach-y nightmare!

// ********** Tankroach **********
/mob/living/simple_animal/hostile/cockroach/tank
	name = "tankroach"
	desc = "A distressingly-robust looking cockroach the size of a dog."
	icon_state = "roachtank"
	icon_dead = "roachtank_dead"
	health = 125
	maxHealth = 125
	mob_size = MOB_SIZE_HUMAN
	// Hits like goddamn
	melee_damage_lower = 7
	melee_damage_upper = 16
	// But slow
	speed = 6
	faction = list("roach")

/mob/living/simple_animal/hostile/cockroach/tank/slip()
	// No slip 4 u. hi traction tankroach
	return FALSE

