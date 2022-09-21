// Giant cockroaches. But wait, there's more!
/mob/living/simple_animal/hostile/cockroach/xl
	name = "extra-large cockroach"
	desc = "Holy shit, did you see the size of that thing?!"
	icon_state = "cockroach_xl"
	icon_dead = "cockroach_xl_dead"
	health = 25
	maxHealth = 25
	mob_size = MOB_SIZE_SMALL
	density = TRUE
	squish_chance = 25
	del_on_death = FALSE
	response_harm_continuous = "crunches"
	response_harm_simple = "crunch"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/roach = 1)

	melee_damage_lower = 5
	melee_damage_upper = 8

	retreat_distance = 2
//	faction = list("roach")

	var/fed = 0
	var/amount_grown = 0


/mob/living/simple_animal/hostile/cockroach/xl/Life()
	. = ..()
	if(!stat)
		amount_grown += rand(0,2)

		if(amount_grown >= 100)
			var/spawn_type
			// Roach adulthood!
			if(fed > 0)
				spawn_type = /mob/living/simple_animal/hostile/cockroach/king
			else
				spawn_type = /mob/living/simple_animal/hostile/cockroach/giant

			if(ispath(spawn_type, /mob))
				var/mob/living/simple_animal/hostile/cockroach/roach = new spawn_type(src.loc, src)
				roach.friends += src.friends
			qdel(src)
