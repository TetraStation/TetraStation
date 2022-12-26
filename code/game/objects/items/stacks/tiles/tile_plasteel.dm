//Plasteel (normal)
/obj/item/stack/tile/plasteel
	name = "floor tile"
	singular_name = "floor tile"
	desc = "The ground you walk on."
	icon_state = "tile"
	inhand_icon_state = "tile"
	force = 6
	custom_materials = list(/datum/material/iron=500)
	throwforce = 10
	flags_1 = CONDUCT_1
	turf_type = /turf/open/floor/plasteel
	mineralType = "metal"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 70)
	resistance_flags = FIRE_PROOF
	matter_amount = 1
	merge_type = /obj/item/stack/tile/plasteel
	tile_reskin_types = list(
		/obj/item/stack/tile/plasteel,
		/obj/item/stack/tile/plasteel/dark,
		/obj/item/stack/tile/plasteel/dark_side,
		/obj/item/stack/tile/plasteel/dark_corner,
		/obj/item/stack/tile/plasteel/checker,
		/obj/item/stack/tile/plasteel/white,
		/obj/item/stack/tile/plasteel/white_side,
		/obj/item/stack/tile/plasteel/white_corner,
		/obj/item/stack/tile/plasteel/cafeteria,
		/obj/item/stack/tile/plasteel/recharge_floor,
		/obj/item/stack/tile/plasteel/chapel,
		/obj/item/stack/tile/plasteel/showroomfloor,
		/obj/item/stack/tile/plasteel/solarpanel,
		/obj/item/stack/tile/plasteel/freezer,
		/obj/item/stack/tile/plasteel/grimy,
		/obj/item/stack/tile/plasteel/sepia,
	)

/obj/item/stack/tile/plasteel/cyborg
	custom_materials = null // All other Borg versions of items have no Metal or Glass - RR
	is_cyborg = 1
	cost = 125


/obj/item/stack/tile/plasteel/base //this subtype should be used for most stuff
	merge_type = /obj/item/stack/tile/plasteel/base

/obj/item/stack/tile/plasteel/dark
	name = "dark tile"
	singular_name = "dark floor tile"
	icon_state = "tile_dark"
	turf_type = /turf/open/floor/plasteel/dark
	merge_type = /obj/item/stack/tile/plasteel/dark

/obj/item/stack/tile/plasteel/dark_side
	name = "half dark tile"
	singular_name = "half dark floor tile"
	icon_state = "tile_darkside"
	turf_type = /turf/open/floor/plasteel/dark/side
	merge_type = /obj/item/stack/tile/plasteel/dark_side
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/plasteel/dark_corner
	name = "quarter dark tile"
	singular_name = "quarter dark floor tile"
	icon_state = "tile_darkcorner"
	turf_type = /turf/open/floor/plasteel/dark/corner
	merge_type = /obj/item/stack/tile/plasteel/dark_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/plasteel/checker
	name = "checker tile"
	singular_name = "checker floor tile"
	icon_state = "tile_checker"
	turf_type = /turf/open/floor/plasteel/checker
	merge_type = /obj/item/stack/tile/plasteel/checker
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/plasteel/white
	name = "white tile"
	singular_name = "white floor tile"
	icon_state = "tile_white"
	turf_type = /turf/open/floor/plasteel/white
	merge_type = /obj/item/stack/tile/plasteel/white

/obj/item/stack/tile/plasteel/white_side
	name = "half white tile"
	singular_name = "half white floor tile"
	icon_state = "tile_whiteside"
	turf_type = /turf/open/floor/plasteel/white/side
	merge_type = /obj/item/stack/tile/plasteel/white_side
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/plasteel/white_corner
	name = "quarter white tile"
	singular_name = "quarter white floor tile"
	icon_state = "tile_whitecorner"
	turf_type = /turf/open/floor/plasteel/white/corner
	merge_type = /obj/item/stack/tile/plasteel/white_corner
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST)

/obj/item/stack/tile/plasteel/cafeteria
	name = "cafeteria tile"
	singular_name = "cafeteria floor tile"
	icon_state = "tile_cafeteria"
	turf_type = /turf/open/floor/plasteel/cafeteria
	merge_type = /obj/item/stack/tile/plasteel/cafeteria
	tile_rotate_dirs = list(SOUTH, NORTH)

/obj/item/stack/tile/plasteel/recharge_floor
	name = "recharge floor tile"
	singular_name = "recharge floor tile"
	icon_state = "tile_recharge"
	turf_type = /turf/open/floor/plasteel/recharge_floor
	merge_type = /obj/item/stack/tile/plasteel/recharge_floor

/obj/item/stack/tile/plasteel/chapel
	name = "chapel floor tile"
	singular_name = "chapel floor tile"
	icon_state = "tile_chapel"
	turf_type = /turf/open/floor/plasteel/chapel
	merge_type = /obj/item/stack/tile/plasteel/chapel
	tile_rotate_dirs = list(SOUTH, NORTH, EAST, WEST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)

/obj/item/stack/tile/plasteel/showroomfloor
	name = "showroom floor tile"
	singular_name = "showroom floor tile"
	icon_state = "tile_showroom"
	turf_type = /turf/open/floor/plasteel/showroomfloor
	merge_type = /obj/item/stack/tile/plasteel/showroomfloor

/obj/item/stack/tile/plasteel/solarpanel
	name = "solar panel tile"
	singular_name = "solar panel floor tile"
	icon_state = "tile_solarpanel"
	turf_type = /turf/open/floor/plasteel/solarpanel
	merge_type = /obj/item/stack/tile/plasteel/solarpanel

/obj/item/stack/tile/plasteel/freezer
	name = "freezer floor tile"
	singular_name = "freezer floor tile"
	icon_state = "tile_freezer"
	turf_type = /turf/open/floor/plasteel/freezer
	merge_type = /obj/item/stack/tile/plasteel/freezer

/obj/item/stack/tile/plasteel/grimy
	name = "grimy floor tile"
	singular_name = "grimy floor tile"
	icon_state = "tile_grimy"
	turf_type = /turf/open/floor/plasteel/grimy
	merge_type = /obj/item/stack/tile/plasteel/grimy

/obj/item/stack/tile/plasteel/sepia
	name = "sepia floor tile"
	singular_name = "sepia floor tile"
	desc = "Well, the flow of time is normal on these tiles, weird."
	icon_state = "tile_sepia"
	turf_type = /turf/open/floor/plasteel/sepia
	merge_type = /obj/item/stack/tile/plasteel/sepia

//Tiles below can't be gotten through tile reskinning

/obj/item/stack/tile/plasteel/bluespace
	name = "bluespace floor tile"
	singular_name = "bluespace floor tile"
	desc = "Sadly, these don't seem to make you faster..."
	icon_state = "tile_bluespace"
	turf_type = /turf/open/floor/plasteel/bluespace
	merge_type = /obj/item/stack/tile/plasteel/bluespace
	tile_reskin_types = null

/obj/item/stack/tile/plasteel/goonplaque
	name = "plaqued floor tile"
	singular_name = "plaqued floor tile"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	icon_state = "tile_plaque"
	turf_type = /turf/open/floor/plasteel/goonplaque
	merge_type = /obj/item/stack/tile/plasteel/goonplaque
	tile_reskin_types = null

/obj/item/stack/tile/plasteel/vaporwave
	name = "vaporwave floor tile"
	singular_name = "vaporwave floor tile"
	icon_state = "tile_vaporwave"
	turf_type = /turf/open/floor/plasteel/vaporwave
	merge_type = /obj/item/stack/tile/plasteel/vaporwave
	tile_reskin_types = null
