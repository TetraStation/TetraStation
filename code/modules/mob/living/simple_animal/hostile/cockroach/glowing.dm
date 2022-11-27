/mob/living/simple_animal/hostile/cockroach/glowing
	name = "Glowing roach"
	desc = "A glowing green cockroach with a radioactive aura."
	icon_state = "radroach"
	icon_dead = "radroach_dead"
	mob_size = MOB_SIZE_HUMAN
	health = 40
	maxHealth = 40
	speed = -1
	melee_damage_lower = 1
	melee_damage_upper = 4
	faction = list("roach")

	minimum_distance = 2
	retreat_distance = 3
	var/attackrads = 50
	var/liferads   = 10

/mob/living/simple_animal/hostile/cockroach/glowing/AttackingTarget()
	radiation_pulse(src, src.attackrads)
	..()

/mob/living/simple_animal/hostile/cockroach/glowing/Life()
	if(prob(1))
		radiation_pulse(src, src.liferads)
	..()
