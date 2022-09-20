/mob/living/simple_animal/hostile/cockroach/nanite
	name = "Nanoroach"
	desc = "A cockroach warped by nanotechnology, covered in metallic formations and jagged outcroppings.\
		It appears to have a nano-forge on its thorax"
	icon_state = "naniteroach"
	faction = list("roach")

	// meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/nano
	turns_per_move = 1
	maxHealth = 30
	health = 30
	minbodytemp = 0
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox"=0,\
				"min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0

	melee_damage_lower = 2
	melee_damage_upper = 4

	var/list/nanite_swarms = list()
	var/max_swarms = 5 // Adjust this for balance as required, I guess?

/mob/living/simple_animal/hostile/cockroach/nanite/AttackingTarget()
	SEND_SIGNAL(src, COMSIG_HOSTILE_ATTACKINGTARGET, target)
	in_melee = TRUE
	if(prob(25) && nanite_swarms.len < max_swarms)
		// Do a little noise, make a little swarm, kick ass tonight
		spawn(0)
			var/mob/living/simple_animal/hostile/cockroach/naniteswarm/M =\
				 new /mob/living/simple_animal/hostile/cockroach/naniteswarm(get_turf(src), src)
			src.nanite_swarms.Add(M)
			M.friends += src.friends
	target.attack_animal(src)

/mob/living/simple_animal/hostile/cockroach/nanite/death()
	for(var/mob/living/simple_animal/hostile/cockroach/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib() // Pop
	..()

/mob/living/simple_animal/hostile/cockroach/nanite/Destroy()
	for(var/mob/living/simple_animal/hostile/cockroach/naniteswarm/NS in nanite_swarms)
		nanite_swarms.Remove(NS)
		NS.gib() // Pop
	. = ..()

/mob/living/simple_animal/hostile/cockroach/naniteswarm
	name = "nanoroach swarm"
	desc = "A swarm of crude nanotech-replica flying cockroaches"
	icon_state = "naniteswarm"
	icon_living = "naniteswarm"

	pass_flags = PASSTABLE
	density = FALSE

	health = 10
	maxHealth = 10

	// They don't do massive amounts of damage on their own...
	melee_damage_lower = 1
	melee_damage_upper = 2
	attack_verb_simple = "cut"
	attack_verb_continuous = "cuts"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	faction = list("roach")

	minbodytemp = 0
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox"=0,\
				"min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0


	var/mob/living/simple_animal/hostile/cockroach/nanite/parent

/mob/living/simple_animal/hostile/cockroach/naniteswarm/New(loc, var/nuparent)
	..()
	parent = nuparent

/mob/living/simple_animal/hostile/cockroach/naniteswarm/death()
	..()
	if(parent)
		parent.nanite_swarms.Remove(src)
	new /obj/effect/decal/cleanable/oil(get_turf(src))
	qdel(src)

/mob/living/simple_animal/hostile/cockroach/naniteswarm/Destroy()
	if(parent)
		parent.nanite_swarms.Remove(src)
		parent = null
	. = ..()
