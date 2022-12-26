/// PLASTEEL TILES ///
/turf/open/floor/plasteel
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/floor/plasteel/examine(mob/user)
	. = ..()
	. += "<span class='notice'>There's a <b>small crack</b> on the edge of it.</span>"

/turf/open/floor/plasteel/rust_heretic_act()
	if(prob(70))
		new /obj/effect/temp_visual/glowing_rune(src)
	ChangeTurf(/turf/open/floor/plating/rust)

/turf/open/floor/plasteel/update_icon_state()
	if(broken || burnt)
		return
	icon_state = base_icon_state

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel)

/turf/open/floor/plasteel/edge
	base_icon_state = "floor_edge"
	icon_state = "floor_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/edge)

/turf/open/floor/plasteel/half
	base_icon_state = "floor_half"
	icon_state = "floor_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/half)

/turf/open/floor/plasteel/anticorner
	base_icon_state = "floor_anticorner"
	icon_state = "floor_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/anticorner)

/turf/open/floor/plasteel/whole
	base_icon_state = "floor_whole"
	icon_state = "floor_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/whole)


/// TEXTURED PLASTEEL TILES ///
/turf/open/floor/plasteel/textured
	base_icon_state = "floor_text"
	icon_state = "floor_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured)

/turf/open/floor/plasteel/textured/edge
	base_icon_state = "floor_tex_edge"
	icon_state = "floor_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/edge)

/turf/open/floor/plasteel/textured/half
	base_icon_state = "floor_tex_half"
	icon_state = "floor_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/half)

/turf/open/floor/plasteel/textured/anticorner
	base_icon_state = "floor_tex_anticorner"
	icon_state = "floor_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/anticorner)

/turf/open/floor/plasteel/textured/whole
	base_icon_state = "floor_tex_whole"
	icon_state = "floor_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/whole)


/// DARK PLASTEEL TILES ///
/turf/open/floor/plasteel/dark
	base_icon_state = "darkfull"
	icon_state = "darkfull"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark)

/turf/open/floor/plasteel/dark/edge
	base_icon_state = "dark_edge"
	icon_state = "dark_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/edge)

/turf/open/floor/plasteel/dark/half
	base_icon_state = "dark_half"
	icon_state = "dark_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/half)

/turf/open/floor/plasteel/dark/anticorner
	base_icon_state = "dark_anticorner"
	icon_state = "dark_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/anticorner)

/turf/open/floor/plasteel/dark/whole
	base_icon_state = "dark_whole"
	icon_state = "dark_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/whole)

/turf/open/floor/plasteel/dark/side
	base_icon_state = "dark"
	icon_state = "dark"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/side)

/turf/open/floor/plasteel/dark/corner
	base_icon_state = "darkcorner"
	icon_state = "darkcorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/corner)

/// TEXTURED DARK PLASTEEL TILES ///
/turf/open/floor/plasteel/dark/textured
	base_icon_state = "dark_tex"
	icon_state = "dark_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured)

/turf/open/floor/plasteel/dark/textured/edge
	base_icon_state = "dark_tex_edge"
	icon_state = "dark_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/edge)

/turf/open/floor/plasteel/dark/textured/half
	base_icon_state = "dark_tex_half"
	icon_state = "dark_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/half)

/turf/open/floor/plasteel/dark/textured/anticorner
	base_icon_state = "dark_tex_anticorner"
	icon_state = "dark_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/anticorner)

/turf/open/floor/plasteel/dark/textured/whole
	base_icon_state = "dark_tex_whole"
	icon_state = "dark_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/whole)

/turf/open/floor/plasteel/checker
	base_icon_state = "checker"
	icon_state = "checker"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/checker)


/// WHITE PLASTEEL TILES ///
/turf/open/floor/plasteel/white
	base_icon_state = "white"
	icon_state = "white"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white)

/turf/open/floor/plasteel/white/edge
	base_icon_state = "white_edge"
	icon_state = "white_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/edge)

/turf/open/floor/plasteel/white/half
	base_icon_state = "white_half"
	icon_state = "white_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/half)

/turf/open/floor/plasteel/white/anticorner
	base_icon_state = "white_anticorner"
	icon_state = "white_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/anticorner)

/turf/open/floor/plasteel/white/whole
	base_icon_state = "white_whole"
	icon_state = "white_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/whole)

/turf/open/floor/plasteel/white/side
	base_icon_state = "whitehall"
	icon_state = "whitehall"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/side)

/turf/open/floor/plasteel/white/corner
	base_icon_state = "whitecorner"
	icon_state = "whitecorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/corner)

/// TEXTURED WHITE PLASTEEL TILES ///
/turf/open/floor/plasteel/white/textured
	base_icon_state = "white_tex"
	icon_state = "white_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured)

/turf/open/floor/plasteel/white/textured/edge
	base_icon_state = "white_tex_edge"
	icon_state = "white_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/edge)

/turf/open/floor/plasteel/white/textured/half
	base_icon_state = "white_tex_half"
	icon_state = "white_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/half)

/turf/open/floor/plasteel/white/textured/anticorner
	base_icon_state = "white_tex_anticorner"
	icon_state = "white_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/anticorner)

/turf/open/floor/plasteel/white/textured/whole
	base_icon_state = "white_tex_whole"
	icon_state = "white_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/whole)

/turf/open/floor/plasteel/yellowsiding
	base_icon_state = "yellowsiding"
	icon_state = "yellowsiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/yellowsiding)

/turf/open/floor/plasteel/yellowsiding/corner
	base_icon_state = "yellowcornersiding"
	icon_state = "yellowcornersiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/yellowsiding/corner)

/turf/open/floor/plasteel/recharge_floor
	base_icon_state = "recharge_floor"
	icon_state = "recharge_floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/recharge_floor)

/turf/open/floor/plasteel/recharge_floor/asteroid
	base_icon_state = "recharge_floor_asteroid"
	icon_state = "recharge_floor_asteroid"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/recharge_floor/asteroid)

/turf/open/floor/plasteel/chapel
	base_icon_state = "chapel"
	icon_state = "chapel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/chapel)

/turf/open/floor/plasteel/showroomfloor
	base_icon_state = "showroomfloor"
	icon_state = "showroomfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/showroomfloor)

/turf/open/floor/plasteel/solarpanel
	base_icon_state = "solarpanel"
	icon_state = "solarpanel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/solarpanel)

/turf/open/floor/plasteel/freezer
	base_icon_state = "freezerfloor"
	icon_state = "freezerfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/freezer)

/turf/open/floor/plasteel/grimy
	base_icon_state = "grimy"
	icon_state = "grimy"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/grimy)

/turf/open/floor/plasteel/cafeteria
	base_icon_state = "cafeteria"
	icon_state = "cafeteria"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/cafeteria)

/// This isn't actually REAL cult tiles - see the /floor/engine subtype.
/turf/open/floor/plasteel/cult
	base_icon_state = "cult"
	icon_state = "cult"
	name = "engraved floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/cult)

/turf/open/floor/plasteel/cult/narsie_act()
	return

/turf/open/floor/plasteel/vaporwave
	base_icon_state = "pinkblack"
	icon_state = "pinkblack"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/vaporwave)

/turf/open/floor/plasteel/goonplaque
	base_icon_state = "plaque"
	icon_state = "plaque"
	name = "commemorative plaque"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/goonplaque)

/turf/open/floor/plasteel/stairs
	base_icon_state = "stairs"
	icon_state = "stairs"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs)

/turf/open/floor/plasteel/stairs/left
	base_icon_state = "stairs-l"
	icon_state = "stairs-l"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/left)

/turf/open/floor/plasteel/stairs/medium
	base_icon_state = "stairs-m"
	icon_state = "stairs-m"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/medium)

/turf/open/floor/plasteel/stairs/right
	base_icon_state = "stairs-r"
	icon_state = "stairs-r"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/right)

/turf/open/floor/plasteel/stairs/old
	base_icon_state = "stairs-old"
	icon_state = "stairs-old"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/old)


/turf/open/floor/plasteel/rockvault
	base_icon_state = "rockvault"
	icon_state = "rockvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault)

/turf/open/floor/plasteel/rockvault/alien
	base_icon_state = "alienvault"
	icon_state = "alienvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault/alien)

/turf/open/floor/plasteel/rockvault/sandstone
	icon_state = "sandstonevault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault/sandstone)


/turf/open/floor/plasteel/elevatorshaft
	icon_state = "elevatorshaft"
	base_icon_state = "elevatorshaft"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/elevatorshaft)

/// These aren't real bluespace tiles.
/turf/open/floor/plasteel/bluespace
	name = "Monotile"
	desc = "Blue-glowing monotiles. These don't make you go faster."
	icon_state = "bluespace"
	base_icon_state = "bluespace"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/bluespace)

/// These aren't real sepia tiles.
/turf/open/floor/plasteel/sepia
	name = "Sepia-Styled Floor"
	icon_state = "sepia"
	base_icon_state = "sepia"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/sepia)
