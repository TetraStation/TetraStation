/*******************************************************************************
		      Random cockroach spawners
*******************************************************************************/

/obj/random/mob/roaches
	name = "random roach"
	icon = 'icons/mob/animal.dmi'
	icon_state = "cockroach"
	alpha = 128

/obj/random/mob/roaches/item_to_spawn()
	return pickweight(list(/mob/living/simple_animal/hostile/cockroach = 9,
				/mob/living/simple_animal/hostile/cockroach/xl = 4,
				/mob/living/simple_animal/hostile/cockroach/hauberoach = 4,
				/mob/living/simple_animal/hostile/cockroach/giant = 1))

/obj/random/mob/roaches/low_chance
	name = "low chance random roach"
	icon = 'icons/mob/animal.dmi'
	icon_state = "cockroach"
	spawn_nothing_percentage = 60

/obj/random/cluster/roaches
	name = "cluster of random roaches"
	icon = 'icons/mob/animal.dmi'
	icon_state = "cockroach"
	alpha = 128
	min_amount = 3
	max_amount = 9
	spread_range = 3

/obj/random/cluster/roaches/item_to_spawn()
	return /obj/random/mob/roaches

/obj/random/cluster/roaches/low_chance
	name = "low chance cluster of random roaches"
	spawn_nothing_percentage = 60
