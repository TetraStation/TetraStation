/// SPECIAL AREAS ///

// Areas that're special in a significant way fall in here. Everything on the CentCom Z-level, along with certain template areas.
// Special areas are meant to me immutable, and nigh untouchable by the sandbox. To summarize quickly:
// Making a room impossible for cult to settle in isn't grounds for it to be an /area/special subtype.
// Making an off-station room for an antagonist to start in IS grounds for the same.

/// Important Gunk ///

/area/special/start
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = STANDARD_GRAVITY


/area/testroom // This path is externally important at the moment, though I'd like to migrate it. Eventually.
	requires_power = FALSE
	name = "Test Room"
	icon_state = "storage"


/// Minigames ///

/area/special/ctf
	name = "Capture the Flag"
	icon_state = "yellow"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/special/ctf/control_room
	name = "Control Room A"

/area/special/ctf/control_room2
	name = "Control Room B"

/area/special/ctf/central
	name = "Central"

/area/special/ctf/main_hall
	name = "Main Hall A"

/area/special/ctf/main_hall2
	name = "Main Hall B"

/area/special/ctf/corridor
	name = "Corridor A"

/area/special/ctf/corridor2
	name = "Corridor B"

/area/special/ctf/flag_room
	name = "Flag Room A"

/area/special/ctf/flag_room2
	name = "Flag Room B"

/// CentCom ///

/area/special/centcom
	name = "CentCom"
	icon_state = "centcom"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

/area/special/centcom/control
	name = "CentCom Docks"

/area/special/centcom/evac
	name = "CentCom Recovery Ship"

/area/special/centcom/supply
	name = "CentCom Supply Shuttle Dock"

/area/special/centcom/ferry
	name = "CentCom Transport Shuttle Dock"

/area/special/centcom/prison
	name = "Admin Prison"

/area/special/centcom/holding
	name = "Holding Facility"

/area/special/centcom/supplypod/supplypod_temp_holding
	name = "Supplypod Shipping lane"
	icon_state = "supplypod_flight"

/area/special/centcom/supplypod
	name = "Supplypod Facility"
	icon_state = "supplypod"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/special/centcom/supplypod/pod_storage
	name = "Supplypod Storage"
	icon_state = "supplypod_holding"

/area/special/centcom/supplypod/loading
	name = "Supplypod Loading Facility"
	icon_state = "supplypod_loading"

/area/special/centcom/supplypod/loading/one
	name = "Bay #1"

/area/special/centcom/supplypod/loading/two
	name = "Bay #2"

/area/special/centcom/supplypod/loading/three
	name = "Bay #3"

/area/special/centcom/supplypod/loading/four
	name = "Bay #4"

/area/special/centcom/supplypod/loading/ert
	name = "ERT Bay"

/// THUNDER DOMEEEEE

/area/special/centcom/tdome
	name = "Thunderdome"
	icon_state = "yellow"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/special/centcom/tdome/arena
	name = "Thunderdome Arena"
	icon_state = "thunder"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/special/centcom/tdome/arena_source
	name = "Thunderdome Arena Template"
	icon_state = "thunder"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED

/area/special/centcom/tdome/tdome1
	name = "Thunderdome (Team 1)"
	icon_state = "green"

/area/special/centcom/tdome/tdome2
	name = "Thunderdome (Team 2)"
	icon_state = "green"

/area/special/centcom/tdome/tdomeadmin
	name = "Thunderdome (Admin.)"
	icon_state = "purple"

/area/special/centcom/tdome/tdomeobserve
	name = "Thunderdome (Observer.)"
	icon_state = "purple"

/// Hostile Entities, Rival Corporations, Etc ///

/area/special/wizard_station
	name = "Wizard's Den"
	icon_state = "yellow"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE

/area/special/abductor_ship
	name = "Abductor Ship"
	icon_state = "yellow"
	requires_power = FALSE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE

/area/special/syndicate_mothership
	name = "Syndicate Mothership"
	icon_state = "syndie-ship"
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT
	flags_1 = NONE
	ambience_index = AMBIENCE_DANGER

/area/special/syndicate_mothership/control
	name = "Syndicate Control Room"
	icon_state = "syndie-control"
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED

/area/special/syndicate_mothership/elite_squad
	name = "Syndicate Elite Squad" // Unused - possibly meant for something similar to /vg/'s Syndie Death Squads?
	icon_state = "syndie-elite" // I need to look into it, frankly.
