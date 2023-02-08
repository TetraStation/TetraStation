/**********************Mine areas**************************/

/area/mine
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED
	holomap_color = HOLOMAP_AREACOLOR_CARGO

/// TODO - DEPRECATE BELOW ///
/area/mine/explored
	name = "Mine"
	icon_state = "explored"
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	flags_1 = NONE
	ambience_index = AMBIENCE_MINING
	area_flags = VALID_TERRITORY | UNIQUE_AREA

/area/mine/unexplored
	name = "Mine"
	icon_state = "unexplored"
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	flags_1 = NONE
	ambientsounds = AMBIENCE_MINING
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED | CAVES_ALLOWED

/// TODO - DEPRECATE ABOVE ///

/area/mine/lobby
	name = "Mining Station"
	icon_state = "mining_lobby"

/area/mine/storage
	name = "Mining Station Storage"
	icon_state = "mining_storage"

/area/mine/production
	name = "Mining Station Starboard Wing"
	icon_state = "mining_production"

/area/mine/abandoned
	name = "Abandoned Mining Station"

/area/mine/living_quarters
	name = "Mining Station Port Wing"
	icon_state = "mining_living"

/area/mine/eva
	name = "Mining Station EVA"
	icon_state = "mining_eva"

/area/mine/maintenance
	name = "Mining Station Communications"
	holomap_color = HOLOMAP_AREACOLOR_MAINTENANCE

/area/mine/cafeteria
	name = "Mining Station Cafeteria"
	icon_state = "mining_labor_cafe"

/area/mine/hydroponics
	name = "Mining Station Hydroponics"
	icon_state = "mining_labor_hydro"
	holomap_color = HOLOMAP_AREACOLOR_SERVICE

/area/mine/sleeper
	name = "Mining Station Medbay"
	holomap_color = HOLOMAP_AREACOLOR_MEDICAL

/area/mine/mechbay
	name = "Mining Station Mech Bay"
	icon_state = "mechbay"
	holomap_color = HOLOMAP_AREACOLOR_SCIENCE

/area/mine/laborcamp
	name = "Labor Camp"
	icon_state = "mining_labor"
	holomap_color = HOLOMAP_AREACOLOR_SECURITY

/area/mine/laborcamp/security
	name = "Labor Camp Security"
	icon_state = "security"
	ambience_index = AMBIENCE_DANGER
