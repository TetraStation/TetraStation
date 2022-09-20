// Dimension-phasing teleporting roach
/mob/living/simple_animal/hostile/cockroach/bluespace
	name = "Bluespace roach"
	desc = "A large shimmering blue cockroach that teleports when attacked"
	icon_state = "bluespaceroach"
	icon_dead = "bluespaceroach_dead"
	mob_size = MOB_SIZE_HUMAN
	sharpness = SHARP_EDGED
	health = 50
	maxHealth = 50
	speed = -1
	melee_damage_lower = 2
	melee_damage_upper = 4
	faction = list("roach")
	minbodytemp = 0
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox"=0,\
				"min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 0

/mob/living/simple_animal/hostile/cockroach/bluespace/AttackingTarget()
	SEND_SIGNAL(src, COMSIG_HOSTILE_ATTACKINGTARGET, target)
	in_melee = TRUE
	var/turf/open/T = get_ranged_target_turf(src, src.dir, rand(2,5))
	return do_teleport(target, T, 8, channel=TELEPORT_CHANNEL_BLUESPACE)

/mob/living/simple_animal/hostile/cockroach/bluespace/bullet_act()
	. = ..()
	// Any old direction will do!
	src.warpflee(pick(GLOB.cardinals))

/mob/living/simple_animal/hostile/cockroach/bluespace/attackby(obj/item/I, mob/user, params)
	. = ..()
	// Away from the thing that's hitting us, ideally!
	src.warpflee(get_cardinal_dir(user, src))

/mob/living/simple_animal/hostile/cockroach/bluespace/proc/warpflee(direction)
	/* When attacked, or otherwise under threat, the bluespace
	roach warps away to a nearby safer space up to 8 tiles
	away. This should have an exponential cooldown, stamina-like
	kinda thing. */
	var/flee_range = 8
	var/turf/open/T = get_ranged_target_turf(src, direction, flee_range)
	src.say("Yeet!")
	do_teleport(src, T, channel=TELEPORT_CHANNEL_BLUESPACE)
