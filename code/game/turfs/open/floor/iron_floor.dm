/// IRON TILES ///
/turf/open/floor/iron
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/iron
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/floor/iron/examine(mob/user)
	. = ..()
	. += "<span class='notice'>There's a <b>small crack</b> on the edge of it.</span>"

/turf/open/floor/iron/rust_heretic_act()
	if(prob(70))
		new /obj/effect/temp_visual/glowing_rune(src)
	ChangeTurf(/turf/open/floor/plating/rust)

/turf/open/floor/iron/update_icon_state()
	if(broken || burnt)
		return
	icon_state = base_icon_state

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron)

/turf/open/floor/iron/edge
	base_icon_state = "floor_edge"
	icon_state = "floor_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/edge)

/turf/open/floor/iron/half
	base_icon_state = "floor_half"
	icon_state = "floor_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/half)

/turf/open/floor/iron/anticorner
	base_icon_state = "floor_anticorner"
	icon_state = "floor_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/anticorner)

/turf/open/floor/iron/whole
	base_icon_state = "floor_whole"
	icon_state = "floor_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/whole)


/// TEXTURED PLASTEEL TILES ///
/turf/open/floor/iron/textured
	base_icon_state = "floor_tex"
	icon_state = "floor_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/textured)

/turf/open/floor/iron/textured/edge
	base_icon_state = "floor_tex_edge"
	icon_state = "floor_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/textured/edge)

/turf/open/floor/iron/textured/half
	base_icon_state = "floor_tex_half"
	icon_state = "floor_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/textured/half)

/turf/open/floor/iron/textured/anticorner
	base_icon_state = "floor_tex_anticorner"
	icon_state = "floor_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/textured/anticorner)

/turf/open/floor/iron/textured/whole
	base_icon_state = "floor_tex_whole"
	icon_state = "floor_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/textured/whole)


/// DARK PLASTEEL TILES ///
/turf/open/floor/iron/dark
	base_icon_state = "darkfull"
	icon_state = "darkfull"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark)

/turf/open/floor/iron/dark/edge
	base_icon_state = "dark_edge"
	icon_state = "dark_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/edge)

/turf/open/floor/iron/dark/half
	base_icon_state = "dark_half"
	icon_state = "dark_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/half)

/turf/open/floor/iron/dark/anticorner
	base_icon_state = "dark_anticorner"
	icon_state = "dark_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/anticorner)

/turf/open/floor/iron/dark/whole
	base_icon_state = "dark_whole"
	icon_state = "dark_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/whole)

/turf/open/floor/iron/dark/side
	base_icon_state = "dark"
	icon_state = "dark"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/side)

/turf/open/floor/iron/dark/corner
	base_icon_state = "darkcorner"
	icon_state = "darkcorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/corner)

/// TEXTURED DARK PLASTEEL TILES ///
/turf/open/floor/iron/dark/textured
	base_icon_state = "dark_tex"
	icon_state = "dark_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/textured)

/turf/open/floor/iron/dark/textured/edge
	base_icon_state = "dark_tex_edge"
	icon_state = "dark_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/textured/edge)

/turf/open/floor/iron/dark/textured/half
	base_icon_state = "dark_tex_half"
	icon_state = "dark_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/textured/half)

/turf/open/floor/iron/dark/textured/anticorner
	base_icon_state = "dark_tex_anticorner"
	icon_state = "dark_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/textured/anticorner)

/turf/open/floor/iron/dark/textured/whole
	base_icon_state = "dark_tex_whole"
	icon_state = "dark_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/dark/textured/whole)

/turf/open/floor/iron/checker
	base_icon_state = "checker"
	icon_state = "checker"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/checker)


/// WHITE PLASTEEL TILES ///
/turf/open/floor/iron/white
	base_icon_state = "white"
	icon_state = "white"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white)

/turf/open/floor/iron/white/edge
	base_icon_state = "white_edge"
	icon_state = "white_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/edge)

/turf/open/floor/iron/white/half
	base_icon_state = "white_half"
	icon_state = "white_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/half)

/turf/open/floor/iron/white/anticorner
	base_icon_state = "white_anticorner"
	icon_state = "white_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/anticorner)

/turf/open/floor/iron/white/whole
	base_icon_state = "white_whole"
	icon_state = "white_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/whole)

/turf/open/floor/iron/white/side
	base_icon_state = "whitehall"
	icon_state = "whitehall"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/side)

/turf/open/floor/iron/white/corner
	base_icon_state = "whitecorner"
	icon_state = "whitecorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/corner)

/// TEXTURED WHITE PLASTEEL TILES ///
/turf/open/floor/iron/white/textured
	base_icon_state = "white_tex"
	icon_state = "white_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/textured)

/turf/open/floor/iron/white/textured/edge
	base_icon_state = "white_tex_edge"
	icon_state = "white_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/textured/edge)

/turf/open/floor/iron/white/textured/half
	base_icon_state = "white_tex_half"
	icon_state = "white_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/textured/half)

/turf/open/floor/iron/white/textured/anticorner
	base_icon_state = "white_tex_anticorner"
	icon_state = "white_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/textured/anticorner)

/turf/open/floor/iron/white/textured/whole
	base_icon_state = "white_tex_whole"
	icon_state = "white_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/white/textured/whole)

/turf/open/floor/iron/yellowsiding
	base_icon_state = "yellowsiding"
	icon_state = "yellowsiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/yellowsiding)

/turf/open/floor/iron/yellowsiding/corner
	base_icon_state = "yellowcornersiding"
	icon_state = "yellowcornersiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/yellowsiding/corner)

/turf/open/floor/iron/recharge_floor
	base_icon_state = "recharge_floor"
	icon_state = "recharge_floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/recharge_floor)

/turf/open/floor/iron/recharge_floor/asteroid
	base_icon_state = "recharge_floor_asteroid"
	icon_state = "recharge_floor_asteroid"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/recharge_floor/asteroid)

/turf/open/floor/iron/chapel
	base_icon_state = "chapel"
	icon_state = "chapel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/chapel)

/turf/open/floor/iron/showroomfloor
	base_icon_state = "showroomfloor"
	icon_state = "showroomfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/showroomfloor)

/turf/open/floor/iron/solarpanel
	base_icon_state = "solarpanel"
	icon_state = "solarpanel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/solarpanel)

/turf/open/floor/iron/freezer
	base_icon_state = "freezerfloor"
	icon_state = "freezerfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/freezer)

/turf/open/floor/iron/grimy
	base_icon_state = "grimy"
	icon_state = "grimy"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/grimy)

/turf/open/floor/iron/cafeteria
	base_icon_state = "cafeteria"
	icon_state = "cafeteria"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/cafeteria)

/// This isn't actually REAL cult tiles - see the /floor/engine subtype.
/turf/open/floor/iron/cult
	base_icon_state = "cult"
	icon_state = "cult"
	name = "engraved floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/cult)

/turf/open/floor/iron/cult/narsie_act()
	return

/turf/open/floor/iron/vaporwave
	base_icon_state = "pinkblack"
	icon_state = "pinkblack"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/vaporwave)

/turf/open/floor/iron/goonplaque
	base_icon_state = "plaque"
	icon_state = "plaque"
	name = "commemorative plaque"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/goonplaque)

/turf/open/floor/iron/stairs
	base_icon_state = "stairs"
	icon_state = "stairs"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/stairs)

/turf/open/floor/iron/stairs/left
	base_icon_state = "stairs-l"
	icon_state = "stairs-l"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/stairs/left)

/turf/open/floor/iron/stairs/medium
	base_icon_state = "stairs-m"
	icon_state = "stairs-m"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/stairs/medium)

/turf/open/floor/iron/stairs/right
	base_icon_state = "stairs-r"
	icon_state = "stairs-r"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/stairs/right)

/turf/open/floor/iron/stairs/old
	base_icon_state = "stairs-old"
	icon_state = "stairs-old"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/stairs/old)


/turf/open/floor/iron/rockvault
	base_icon_state = "rockvault"
	icon_state = "rockvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/rockvault)

/turf/open/floor/iron/rockvault/alien
	base_icon_state = "alienvault"
	icon_state = "alienvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/rockvault/alien)

/turf/open/floor/iron/rockvault/sandstone
	icon_state = "sandstonevault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/rockvault/sandstone)


/turf/open/floor/iron/elevatorshaft
	icon_state = "elevatorshaft"
	base_icon_state = "elevatorshaft"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/elevatorshaft)

/// These aren't real bluespace tiles.
/turf/open/floor/iron/bluespace
	name = "Monotile"
	desc = "Blue-glowing monotiles. These don't make you go faster."
	icon_state = "bluespace"
	base_icon_state = "bluespace"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/bluespace)

/// These aren't real sepia tiles.
/turf/open/floor/iron/sepia
	name = "Sepia-Styled Floor"
	icon_state = "sepia"
	base_icon_state = "sepia"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/iron/sepia)
