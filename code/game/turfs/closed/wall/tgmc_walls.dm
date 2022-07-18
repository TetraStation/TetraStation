// Marine ship & facility walls

/turf/closed/wall/mil/
	icon = 'icons/turf/tgmc_walls.dmi'
	name = "hull"
	desc = "A chunk of metal used to separate rooms and make up a ship or station."
	icon_state = "testwall0"

/turf/closed/wall/mil/nosmooth
	canSmoothWith = null

/turf/closed/wall/mil/outer
	name = "outer hull"
	desc = "A stout chunk of metal used to separate the inside from the outside."
	hardness = 30
	slicing_duration = 120
	explosion_block = 2

/turf/closed/wall/mil/white
	icon_state = "wwall0"

/turf/closed/wall/mil/gray
	icon_state = "gwall0"

/turf/closed/wall/mil/rnd/containment
	name = "cell wall"
	desc = "A hardened wall for use in building containment cells."
	hardness = 20
	slicing_duration = 120
	explosion_block = 2
	sheet_type = /obj/item/stack/sheet/plasteel
	girder_type = /obj/structure/girder/reinforced
	rad_insulation = RAD_MEDIUM_INSULATION

/turf/closed/wall/mil/rnd/containment/wall_singularity_pull(current_size)
	if(current_size >= STAGE_FOUR)
		if(prob(30))
			dismantle_wall()

/turf/closed/wall/mil/rnd/containment/corner
	icon_state = "containment_wall_corner"

/turf/closed/wall/mil/rnd/containment/divide
	icon_state = "containment_wall_divide"

/turf/closed/wall/mil/rnd/containment/south
	icon_state = "containment_wall_s"

/turf/closed/wall/mil/rnd/containment/west
	icon_state = "containment_wall_w"

/turf/closed/wall/mil/rnd/containment/east
	icon_state = "containment_wall_e"

/turf/closed/wall/mil/rnd/containment/north
	icon_state = "containment_wall_n"

/turf/closed/wall/mil/rnd/containment/connect_e
	icon_state = "containment_wall_connect_e"

/turf/closed/wall/mil/rnd/containment/connect3
	icon_state = "containment_wall_connect3"

/turf/closed/wall/mil/rnd/containment/connect_w
	icon_state = "containment_wall_connect_w"

/turf/closed/wall/mil/rnd/containment/connect_w2
	icon_state = "containment_wall_connect_w2"

/turf/closed/wall/mil/rnd/containment/connect_e2
	icon_state = "containment_wall_connect_e2"

/turf/closed/wall/mil/rnd/containment/connect_s1
	icon_state = "containment_wall_connect_s1"

/turf/closed/wall/mil/rnd/containment/connect_s2
	icon_state = "containment_wall_connect_s2"

/turf/closed/wall/mil/rnd/containment/window
	name = "cell window"
	icon_state = "containment_window"
	opacity = FALSE
