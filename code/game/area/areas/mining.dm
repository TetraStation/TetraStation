/**********************Mine areas**************************/

/area/mine
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	area_flags = VALID_TERRITORY | UNIQUE_AREA | FLORA_ALLOWED

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

/area/mine/cafeteria
	name = "Mining Station Cafeteria"
	icon_state = "mining_labor_cafe"

/area/mine/hydroponics
	name = "Mining Station Hydroponics"
	icon_state = "mining_labor_hydro"

/area/mine/sleeper
	name = "Mining Station Emergency Sleeper"

/area/mine/mechbay
	name = "Mining Station Mech Bay"
	icon_state = "mechbay"

/area/mine/laborcamp
	name = "Labor Camp"
	icon_state = "mining_labor"

/area/mine/laborcamp/security
	name = "Labor Camp Security"
	icon_state = "security"
	ambience_index = AMBIENCE_DANGER



/**********************Ice Moon Areas**************************/

/area/planetary/icemoon
	icon_state = "mining"
	has_gravity = STANDARD_GRAVITY
	flags_1 = NONE
	area_flags = UNIQUE_AREA | FLORA_ALLOWED

/area/planetary/icemoon/surface
	name = "Icemoon"
	icon_state = "explored"
	always_unpowered = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambience_index = AMBIENCE_MINING
	area_flags = UNIQUE_AREA | FLORA_ALLOWED

/area/planetary/icemoon/surface/outdoors // weather happens here
	name = "Icemoon Wastes"
	outdoors = TRUE

/area/planetary/icemoon/surface/outdoors/labor_camp
	name = "Icemoon Labor Camp"
	area_flags = UNIQUE_AREA

/area/planetary/icemoon/surface/outdoors/unexplored //monsters and ruins spawn here
	icon_state = "unexplored"
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | CAVES_ALLOWED

/area/planetary/icemoon/surface/outdoors/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/icemoon/surface

/area/planetary/icemoon/surface/outdoors/unexplored/rivers/no_monsters
	area_flags = UNIQUE_AREA | FLORA_ALLOWED | CAVES_ALLOWED

/area/planetary/icemoon/underground
	name = "Icemoon Caves"
	outdoors = TRUE
	always_unpowered = TRUE
	requires_power = TRUE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	ambience_index = AMBIENCE_MINING
	area_flags = UNIQUE_AREA | FLORA_ALLOWED

/area/planetary/icemoon/underground/unexplored // mobs and megafauna and ruins spawn here
	name = "Icemoon Caves"
	icon_state = "unexplored"
	area_flags = CAVES_ALLOWED | FLORA_ALLOWED | MOB_SPAWN_ALLOWED | MEGAFAUNA_SPAWN_ALLOWED

/area/planetary/icemoon/underground/unexplored/rivers // rivers spawn here
	icon_state = "danger"
	map_generator = /datum/map_generator/cave_generator/icemoon

/area/planetary/icemoon/underground/explored // ruins can't spawn here
	name = "Icemoon Underground"
	area_flags = UNIQUE_AREA
