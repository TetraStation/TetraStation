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

/turf/open/floor/plasteel/update_icon()
	. = ..()
	if(!.)
		return
	if(!broken && !burnt)
		icon_state = icon_regular_floor

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel)

/turf/open/floor/plasteel/edge
	icon_state = "floor_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/edge)

/turf/open/floor/plasteel/half
	icon_state = "floor_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/half)

/turf/open/floor/plasteel/anticorner
	icon_state = "floor_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/anticorner)

/turf/open/floor/plasteel/whole
	icon_state = "floor_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/whole)


/// TEXTURED PLASTEEL TILES ///
/turf/open/floor/plasteel/textured
	icon_state = "floor_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured)

/turf/open/floor/plasteel/textured/edge
	icon_state = "floor_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/edge)

/turf/open/floor/plasteel/textured/half
	icon_state = "floor_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/half)

/turf/open/floor/plasteel/textured/anticorner
	icon_state = "floor_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/anticorner)

/turf/open/floor/plasteel/textured/whole
	icon_state = "floor_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/textured/whole)


/// DARK PLASTEEL TILES ///
/turf/open/floor/plasteel/dark
	icon_state = "darkfull"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark)

/turf/open/floor/plasteel/dark/edge
	icon_state = "dark_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/edge)

/turf/open/floor/plasteel/dark/half
	icon_state = "dark_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/half)

/turf/open/floor/plasteel/dark/anticorner
	icon_state = "dark_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/anticorner)

/turf/open/floor/plasteel/dark/whole
	icon_state = "dark_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/whole)

/turf/open/floor/plasteel/dark/side
	icon_state = "dark"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/side)

/turf/open/floor/plasteel/dark/corner
	icon_state = "darkcorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/corner)

/// TEXTURED DARK PLASTEEL TILES ///
/turf/open/floor/plasteel/dark/textured
	icon_state = "dark_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured)

/turf/open/floor/plasteel/dark/textured/edge
	icon_state = "dark_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/edge)

/turf/open/floor/plasteel/dark/textured/half
	icon_state = "dark_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/half)

/turf/open/floor/plasteel/dark/textured/anticorner
	icon_state = "dark_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/anticorner)

/turf/open/floor/plasteel/dark/textured/whole
	icon_state = "dark_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/dark/textured/whole)

/turf/open/floor/plasteel/checker
	icon_state = "checker"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/checker)


/// WHITE PLASTEEL TILES ///
/turf/open/floor/plasteel/white
	icon_state = "white"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white)

/turf/open/floor/plasteel/white/edge
	icon_state = "white_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/edge)

/turf/open/floor/plasteel/white/half
	icon_state = "white_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/half)

/turf/open/floor/plasteel/white/anticorner
	icon_state = "white_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/anticorner)

/turf/open/floor/plasteel/white/whole
	icon_state = "white_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/whole)

/turf/open/floor/plasteel/white/side
	icon_state = "whitehall"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/side)

/turf/open/floor/plasteel/white/corner
	icon_state = "whitecorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/corner)

/// TEXTURED WHITE PLASTEEL TILES ///
/turf/open/floor/plasteel/white/textured
	icon_state = "white_tex"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured)

/turf/open/floor/plasteel/white/textured/edge
	icon_state = "white_tex_edge"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/edge)

/turf/open/floor/plasteel/white/textured/half
	icon_state = "white_tex_half"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/half)

/turf/open/floor/plasteel/white/textured/anticorner
	icon_state = "white_tex_anticorner"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/anticorner)

/turf/open/floor/plasteel/white/textured/whole
	icon_state = "white_tex_whole"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/white/textured/whole)

/turf/open/floor/plasteel/yellowsiding
	icon_state = "yellowsiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/yellowsiding)

/turf/open/floor/plasteel/yellowsiding/corner
	icon_state = "yellowcornersiding"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/yellowsiding/corner)

/turf/open/floor/plasteel/recharge_floor
	icon_state = "recharge_floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/recharge_floor)

/turf/open/floor/plasteel/recharge_floor/asteroid
	icon_state = "recharge_floor_asteroid"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/recharge_floor/asteroid)

/turf/open/floor/plasteel/chapel
	icon_state = "chapel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/chapel)

/turf/open/floor/plasteel/showroomfloor
	icon_state = "showroomfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/showroomfloor)

/turf/open/floor/plasteel/solarpanel
	icon_state = "solarpanel"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/solarpanel)

/turf/open/floor/plasteel/freezer
	icon_state = "freezerfloor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/freezer)

/turf/open/floor/plasteel/grimy
	icon_state = "grimy"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/grimy)

/turf/open/floor/plasteel/cafeteria
	icon_state = "cafeteria"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/cafeteria)

/// This isn't actually REAL cult tiles - see the /floor/engine subtype.
/turf/open/floor/plasteel/cult
	icon_state = "cult"
	name = "engraved floor"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/cult)

/turf/open/floor/plasteel/cult/narsie_act()
	return

/turf/open/floor/plasteel/vaporwave
	icon_state = "pinkblack"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/vaporwave)

/turf/open/floor/plasteel/goonplaque
	icon_state = "plaque"
	name = "commemorative plaque"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/goonplaque)

/turf/open/floor/plasteel/stairs
	icon_state = "stairs"
	tiled_dirt = FALSE

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs)

/turf/open/floor/plasteel/stairs/left
	icon_state = "stairs-l"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/left)

/turf/open/floor/plasteel/stairs/medium
	icon_state = "stairs-m"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/medium)

/turf/open/floor/plasteel/stairs/right
	icon_state = "stairs-r"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/right)

/turf/open/floor/plasteel/stairs/old
	icon_state = "stairs-old"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/stairs/old)


/turf/open/floor/plasteel/rockvault
	icon_state = "rockvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault)

/turf/open/floor/plasteel/rockvault/alien
	icon_state = "alienvault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault/alien)

/turf/open/floor/plasteel/rockvault/sandstone
	icon_state = "sandstonevault"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/rockvault/sandstone)


/turf/open/floor/plasteel/elevatorshaft
	icon_state = "elevatorshaft"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/elevatorshaft)

/// These aren't real bluespace tiles.
/turf/open/floor/plasteel/bluespace
	name = "Monotile"
	desc = "Blue-glowing monotiles. These don't make you go faster."
	icon_state = "bluespace"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/bluespace)

/// These aren't real sepia tiles.
/turf/open/floor/plasteel/sepia
	name = "Sepia-Styled Floor"
	icon_state = "sepia"

TURF_ATMOS_SUBTYPE_HELPER(/turf/open/floor/plasteel/sepia)
