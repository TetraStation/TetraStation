/mob/living/simple_animal/hostile/cockroach/giant
	name = "giant cockroach"
	desc = "Oh god, oh shit, what the fuck?"
	icon_state = "cockroach_monster"
	icon_dead = "cockroach_monster_dead"
	health = 20
	mob_size = MOB_SIZE_HUMAN
	pass_flags = PASSTABLE
	squish_chance = 0
	del_on_death = FALSE
	response_harm_continuous = "smacks"
	response_harm_simple = "smack"
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/roach = 3)
	melee_damage_lower = 6
	melee_damage_upper = 12
//	faction = list("roach")
