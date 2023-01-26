/// Station-Bound Areas ///

/// Maintenance

/area/station/maintenance
	ambience_index = AMBIENCE_MAINT
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA
	airlock_wires = /datum/wires/airlock/maint

// Departmental Maintenance

/area/station/maintenance/department/chapel
	name = "Chapel Maintenance"
	icon_state = "maint_chapel"

/area/station/maintenance/department/chapel/monastery
	name = "Monastery Maintenance"
	icon_state = "maint_monastery"

/area/station/maintenance/department/crew_quarters/bar
	name = "Bar Maintenance"
	icon_state = "maint_bar"

/area/station/maintenance/department/crew_quarters/dorms
	name = "Dormitory Maintenance"
	icon_state = "maint_dorms"

/area/station/maintenance/department/eva
	name = "EVA Maintenance"
	icon_state = "maint_eva"

/area/station/maintenance/department/electrical
	name = "Electrical Maintenance"
	icon_state = "maint_electrical"

/area/station/maintenance/department/engine/atmos
	name = "Atmospherics Maintenance"
	icon_state = "maint_atmos"

/area/station/maintenance/department/security
	name = "Security Maintenance"
	icon_state = "maint_sec"

/area/station/maintenance/department/security/upper
	name = "Upper Security Maintenance"

/area/station/maintenance/department/security/brig
	name = "Brig Maintenance"
	icon_state = "maint_brig"

/area/station/maintenance/department/medical
	name = "Medbay Maintenance"
	icon_state = "medbay_maint"

/area/station/maintenance/department/medical/central
	name = "Central Medbay Maintenance"
	icon_state = "medbay_maint_central"

/area/station/maintenance/department/medical/morgue
	name = "Morgue Maintenance"
	icon_state = "morgue_maint"

/area/station/maintenance/department/science
	name = "Science Maintenance"
	icon_state = "maint_sci"

/area/station/maintenance/department/science/central
	name = "Central Science Maintenance"
	icon_state = "maint_sci_central"

/area/station/maintenance/department/cargo
	name = "Cargo Maintenance"
	icon_state = "maint_cargo"

/area/station/maintenance/department/bridge
	name = "Bridge Maintenance"
	icon_state = "maint_bridge"

/area/station/maintenance/department/engine
	name = "Engineering Maintenance"
	icon_state = "maint_engi"

/area/station/maintenance/department/science/xenobiology
	name = "Xenobiology Maintenance"
	icon_state = "xenomaint"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA | XENOBIOLOGY_COMPATIBLE

/// Directional Maintenance

/area/station/maintenance/aft
	name = "Aft Maintenance"
	icon_state = "amaint"

/area/station/maintenance/aft/upper
	name = "Upper Aft Maintenance"

/area/station/maintenance/aft/secondary
	name = "Aft Maintenance"
	icon_state = "amaint_2"

/area/station/maintenance/central
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/central/secondary
	name = "Central Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/fore
	name = "Fore Maintenance"
	icon_state = "fmaint"

/area/station/maintenance/fore/upper
	name = "Upper Fore Maintenance"

/area/station/maintenance/fore/secondary
	name = "Fore Maintenance"
	icon_state = "fmaint_2"

/area/station/maintenance/starboard
	name = "Starboard Maintenance"
	icon_state = "smaint"

/area/station/maintenance/starboard/upper
	name = "Upper Starboard Maintenance"

/area/station/maintenance/starboard/central
	name = "Central Starboard Maintenance"
	icon_state = "smaint"

/area/station/maintenance/starboard/secondary
	name = "Secondary Starboard Maintenance"
	icon_state = "smaint_2"

/area/station/maintenance/starboard/aft
	name = "Starboard Quarter Maintenance"
	icon_state = "asmaint"

/area/station/maintenance/starboard/aft/secondary
	name = "Secondary Starboard Quarter Maintenance"
	icon_state = "asmaint_2"

/area/station/maintenance/starboard/fore
	name = "Starboard Bow Maintenance"
	icon_state = "fsmaint"

/area/station/maintenance/port
	name = "Port Maintenance"
	icon_state = "pmaint"

/area/station/maintenance/port/central
	name = "Central Port Maintenance"
	icon_state = "maintcentral"

/area/station/maintenance/port/aft
	name = "Port Quarter Maintenance"
	icon_state = "apmaint"

/area/station/maintenance/port/fore
	name = "Port Bow Maintenance"
	icon_state = "fpmaint"

/area/station/maintenance/external
	name = "External Hull Access"
	icon_state = "amaint"

/area/station/maintenance/external/aft
	name = "Aft External Hull Access"

/area/station/maintenance/external/port
	name = "Port External Hull Access"

/area/station/maintenance/external/port/bow
	name = "Port Bow External Hull Access"

/// Rooms

/area/station/maintenance/disposal
	name = "Waste Disposal"
	icon_state = "disposal"

/area/station/maintenance/disposal/incinerator
	name = "Incinerator"
	icon_state = "incinerator"

/area/station/maintenance/electronic_marketing_den
	name = "Electronic Marketing Den"
	icon_state = "abandoned_m_den"

/area/station/maintenance/abandoned_gambling_den
	name = "Abandoned Gambling Den"
	icon_state = "abandoned_g_den"

/area/station/maintenance/abandoned_gambling_den/secondary
	icon_state = "abandoned_g_den_2"

/// Solars

/area/station/maintenance/solars
	name = "Solar Maintenance"
	icon_state = "yellow"

/area/station/maintenance/solars/port
	name = "Port Solar Maintenance"
	icon_state = "SolarcontrolP"

/area/station/maintenance/solars/port/aft
	name = "Port Quarter Solar Maintenance"
	icon_state = "SolarcontrolAP"

/area/station/maintenance/solars/port/fore
	name = "Port Bow Solar Maintenance"
	icon_state = "SolarcontrolFP"

/area/station/maintenance/solars/starboard
	name = "Starboard Solar Maintenance"
	icon_state = "SolarcontrolS"

/area/station/maintenance/solars/starboard/aft
	name = "Starboard Quarter Solar Maintenance"
	icon_state = "SolarcontrolAS"

/area/station/maintenance/solars/starboard/fore
	name = "Starboard Bow Solar Maintenance"
	icon_state = "SolarcontrolFS"

/// Hallways ///

/area/station/hallway/primary/aft
	name = "Aft Primary Hallway"
	icon_state = "hallA"

/area/station/hallway/primary/fore
	name = "Fore Primary Hallway"
	icon_state = "hallF"

/area/station/hallway/primary/starboard
	name = "Starboard Primary Hallway"
	icon_state = "hallS"

/area/station/hallway/primary/port
	name = "Port Primary Hallway"
	icon_state = "hallP"

/area/station/hallway/primary/central
	name = "Central Primary Hallway"
	icon_state = "hallC"

/area/station/hallway/primary/upper
	name = "Upper Central Primary Hallway"
	icon_state = "hallC"


/area/station/hallway/secondary/command
	name = "Command Hallway"
	icon_state = "bridge_hallway"

/area/station/hallway/secondary/construction
	name = "Construction Area"
	icon_state = "construction"

/area/station/hallway/secondary/exit
	name = "Escape Shuttle Hallway"
	icon_state = "escape"

/area/station/hallway/secondary/exit/departure_lounge
	name = "Departure Lounge"
	icon_state = "escape_lounge"

/area/station/hallway/secondary/entry
	name = "Arrival Shuttle Hallway"
	icon_state = "entry"

/area/station/hallway/secondary/service
	name = "Service Hallway"
	icon_state = "hall_service"

/// Command ///

/area/station/bridge
	name = "Bridge"
	icon_state = "bridge"
	ambientsounds = list('sound/ambience/signal.ogg')
	airlock_wires = /datum/wires/airlock/command

/area/station/bridge/meeting_room
	name = "Heads of Staff Meeting Room"
	icon_state = "meeting"

/area/station/bridge/meeting_room/council
	name = "Council Chamber"
	icon_state = "meeting"

/area/station/bridge/showroom/corporate
	name = "Corporate Showroom"
	icon_state = "showroom"

/area/station/bridge/teleporter
	name = "Teleporter Room"
	icon_state = "teleporter"
	ambience_index = AMBIENCE_ENGI

/area/station/bridge/gateway
	name = "Gateway"
	icon_state = "gateway"
	ambience_index = AMBIENCE_ENGI

/area/ai_monitored/storage/nuke
	name = "Vault"
	icon_state = "nuke_storage"

/area/ai_monitored/storage/eva
	name = "EVA Storage"
	icon_state = "eva"
	ambience_index = AMBIENCE_DANGER

/area/ai_monitored/storage/eva/upper
	name = "Upper EVA Storage"

/area/station/crew_quarters/heads
	airlock_wires = /datum/wires/airlock/command

/area/station/crew_quarters/heads/captain
	name = "Captain's Office"
	icon_state = "captain"

/area/station/crew_quarters/heads/captain/private
	name = "Captain's Quarters"
	icon_state = "captain_private"

/area/station/crew_quarters/heads/chief
	name = "Chief Engineer's Office"
	icon_state = "ce_office"

/area/station/crew_quarters/heads/cmo
	name = "Chief Medical Officer's Office"
	icon_state = "cmo_office"

/area/station/crew_quarters/heads/hop
	name = "Head of Personnel's Office"
	icon_state = "hop_office"

/area/station/crew_quarters/heads/hos
	name = "Head of Security's Office"
	icon_state = "hos_office"

/area/station/crew_quarters/heads/research_director
	name = "Research Director's Office"
	icon_state = "rd_office"

/// Public ///

/// Crew Quarters

/area/station/crew_quarters/dorms
	name = "Dormitories"
	icon_state = "dorms"
	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA

/area/station/crew_quarters/dorms/barracks
	name = "Sleep Barracks"

/area/station/crew_quarters/dorms/barracks/male
	name = "Male Sleep Barracks"
	icon_state = "dorms_male"

/area/station/crew_quarters/dorms/barracks/female
	name = "Female Sleep Barracks"
	icon_state = "dorms_female"

/area/station/crew_quarters/toilet
	name = "Dormitory Toilets"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/auxiliary
	name = "Auxiliary Restrooms"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/locker
	name = "Locker Toilets"
	icon_state = "toilet"

/area/station/crew_quarters/toilet/restrooms
	name = "Restrooms"
	icon_state = "toilet"

/area/station/crew_quarters/locker
	name = "Locker Room"
	icon_state = "locker"

/area/station/crew_quarters/lounge
	name = "Lounge"
	icon_state = "lounge"

/area/station/crew_quarters/fitness
	name = "Fitness Room"
	icon_state = "fitness"

/area/station/crew_quarters/fitness/locker_room
	name = "Unisex Locker Room"
	icon_state = "locker"

/area/station/crew_quarters/fitness/locker_room/male
	name = "Male Locker Room"
	icon_state = "locker_male"

/area/station/crew_quarters/fitness/locker_room/female
	name = "Female Locker Room"
	icon_state = "locker_female"

/area/station/crew_quarters/fitness/recreation
	name = "Recreation Area"
	icon_state = "rec"

/area/station/crew_quarters/cafeteria
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/station/crew_quarters/vacant_room
	name = "Vacant Room"
	icon_state = "vacant_room"
	ambience_index = AMBIENCE_MAINT

/area/station/crew_quarters/vacant_room/office
	name = "Vacant Office"
	icon_state = "vacant_office"

/area/station/crew_quarters/vacant_room/commissary
	name = "Vacant Commissary"
	icon_state = "vacant_commissary"

/// Service ///

/area/station/service
	airlock_wires = /datum/wires/airlock/service

/area/station/service/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/station/service/kitchen/coldroom
	name = "Kitchen Cold Room"
	icon_state = "kitchen_cold"

/area/station/service/bar
	name = "Bar"
	icon_state = "bar"
	mood_bonus = 5
	mood_message = "<span class='nicegreen'>I love being in the bar!\n</span>"

/area/station/service/bar/atrium
	name = "Atrium"
	icon_state = "bar"

/area/station/service/theatre
	name = "Theatre"
	icon_state = "theatre"

/area/station/service/theatre/stage
	name = "Theatre Stage"
	icon_state = "theatre_stage"

/area/station/service/theatre/backstage
	name = "Theatre Backstage"
	icon_state = "theatre_backstage"

/area/station/service/theatre/abandoned
	name = "Abandoned Theatre"
	icon_state = "abandoned_theatre"

/area/station/service/library
	name = "Library"
	icon_state = "library"
	flags_1 = CULT_PERMITTED_1

/area/station/service/library/lounge
	name = "Library Lounge"
	icon_state = "library_lounge"

/area/station/service/library/artgallery
	name = " Art Gallery"
	icon_state = "library_gallery"

/area/station/service/library/private
	name = "Library Private Study"
	icon_state = "library_gallery_private"

/area/station/service/library/upper
	name = "Library Upper Floor"
	icon_state = "library"

/area/station/service/library/printer
	name = "Library Printer Room"
	icon_state = "library"

/area/station/service/library/abandoned
	name = "Abandoned Library"
	icon_state = "abandoned_library"
	flags_1 = CULT_PERMITTED_1

/area/station/service/chapel
	name = "Chapel"
	icon_state = "chapel"
	ambience_index = AMBIENCE_HOLY
	flags_1 = NONE

/area/station/service/chapel/monastery
	name = "Monastery"

/area/station/service/chapel/office
	name = "Chapel Office"
	icon_state = "chapeloffice"

/area/station/service/chapel/asteroid
	name = "Chapel Asteroid"
	icon_state = "explored"

/area/station/service/chapel/asteroid/monastery
	name = "Monastery Asteroid"

/area/station/service/chapel/dock
	name = "Chapel Dock"
	icon_state = "construction"

/area/station/service/lawoffice
	name = "Law Office"
	icon_state = "law"

/area/station/service/janitor
	name = "Custodial Closet"
	icon_state = "janitor"
	flags_1 = CULT_PERMITTED_1

/area/station/service/hydroponics
	name = "Hydroponics"
	icon_state = "hydro"
	airlock_wires = /datum/wires/airlock/service

/area/station/service/hydroponics/upper
	name = "Upper Hydroponics"
	icon_state = "hydro"

/area/station/service/hydroponics/garden
	name = "Garden"
	icon_state = "garden"

/area/station/service/hydroponics/garden/abandoned
	name = "Abandoned Garden"
	icon_state = "abandoned_garden"

/area/station/service/hydroponics/garden/monastery
	name = "Monastery Garden"
	icon_state = "hydro"

/// Engineering ///

/area/station/engineering
	name = "Engineering"
	icon_state = "engine"
	ambience_index = AMBIENCE_ENGI
	airlock_wires = /datum/wires/airlock/engineering

/area/station/engineering/engine_smes
	name = "Engineering SMES"
	icon_state = "engine_smes"

/area/station/engineering/atmos
	name = "Atmospherics"
	icon_state = "atmos"
	flags_1 = CULT_PERMITTED_1

/area/station/engineering/atmos/upper
	name = "Upper Atmospherics"

/area/station/engineering/atmospherics_engine
	name = "Atmospherics Engine"
	icon_state = "atmos_engine"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA

/area/station/engineering/engine_room //donut station specific
	name = "Engine Room"
	icon_state = "atmos_engine"

/area/station/engineering/lobby
	name = "Engineering Lobby"
	icon_state = "engi_lobby"

/area/station/engineering/engine_room/external
	name = "Supermatter External Access"
	icon_state = "engine_foyer"

/area/station/engineering/supermatter
	name = "Supermatter Engine"
	icon_state = "engine_sm"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA

/area/station/engineering/break_room
	name = "Engineering Foyer"
	icon_state = "engine_break"

/area/station/engineering/gravity_generator
	name = "Gravity Generator Room"
	icon_state = "grav_gen"

/area/station/engineering/storage
	name = "Engineering Storage"
	icon_state = "engi_storage"

/area/station/engineering/storage_shared
	name = "Shared Engineering Storage"
	icon_state = "engi_storage"

/area/station/engineering/transit_tube
	name = "Transit Tube"
	icon_state = "transit_tube"

/area/station/engineering/ptl_chamber
	name = "Power Transmission Room"
	icon = 'icons/obj/power_transfer.dmi'
	icon_state = "ptl-room"

/area/station/engineering/construction
	name = "Construction Area"
	icon_state = "construction"
	ambience_index = AMBIENCE_ENGI

/area/station/engineering/construction/mining/aux_base
	name = "Auxiliary Base Construction"
	icon_state = "aux_base_construction"

/area/station/engineering/construction/storage_wing
	name = "Storage Wing"
	icon_state = "storage_wing"

/area/station/engineering/tcommsat
	name = "Telecomms Control Room"
	icon_state = "tcomsatcomp"
	ambientsounds = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg', 'sound/ambience/ambitech.ogg',\
											'sound/ambience/ambitech2.ogg', 'sound/ambience/ambitech3.ogg', 'sound/ambience/ambimystery.ogg')
	airlock_wires = /datum/wires/airlock/engineering
	network_root_id = STATION_NETWORK_ROOT	// They should of unpluged the router before they left

/area/station/engineering/tcommsat/server
	name = "Telecomms Server Room"
	icon_state = "tcomsatcham"

/area/station/engineering/tcommsat/server/upper
	name = "Upper Telecomms Server Room"

/// Solar Arrays ///

/area/station/solar_array
	requires_power = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_IFSTARLIGHT
	area_flags = UNIQUE_AREA
	flags_1 = NONE
	ambience_index = AMBIENCE_ENGI
	airlock_wires = /datum/wires/airlock/engineering

/area/station/solar_array/fore
	name = "Fore Solar Array"
	icon_state = "yellow"

/area/station/solar_array/aft
	name = "Aft Solar Array"
	icon_state = "yellow"

/area/station/solar_array/aux/port
	name = "Port Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/station/solar_array/aux/starboard
	name = "Starboard Bow Auxiliary Solar Array"
	icon_state = "panelsA"

/area/station/solar_array/starboard
	name = "Starboard Solar Array"
	icon_state = "panelsS"

/area/station/solar_array/starboard/aft
	name = "Starboard Quarter Solar Array"
	icon_state = "panelsAS"

/area/station/solar_array/starboard/fore
	name = "Starboard Bow Solar Array"
	icon_state = "panelsFS"

/area/station/solar_array/port
	name = "Port Solar Array"
	icon_state = "panelsP"

/area/station/solar_array/port/aft
	name = "Port Quarter Solar Array"
	icon_state = "panelsAP"

/area/station/solar_array/port/fore
	name = "Port Bow Solar Array"
	icon_state = "panelsFP"

/area/station/solar_array/aisat
	name = "AI Satellite Solars"
	icon_state = "yellow"

/// Medbay ///

/area/station/medical
	name = "Medical"
	icon_state = "medbay1"
	ambience_index = AMBIENCE_MEDICAL
	airlock_wires = /datum/wires/airlock/medbay

/area/station/medical/abandoned
	name = "Abandoned Medbay"
	icon_state = "abandoned_medbay"
	ambientsounds = list('sound/ambience/signal.ogg')

/area/station/medical/medbay/central
	name = "Medbay Central"
	icon_state = "med_central"

/area/station/medical/medbay/lobby
	name = "Medbay Lobby"
	icon_state = "med_lobby"

/area/station/medical/medbay/zone2 // Regrettably have to keep this in because of Pubbystation, but this SPECIFIC /area/ I loathe. So much
	name = "Medbay"
	icon_state = "medbay2"

/area/station/medical/medbay/aft
	name = "Medbay Aft"
	icon_state = "med_aft"

/area/station/medical/storage
	name = "Medbay Storage"
	icon_state = "med_storage"

/area/station/medical/paramedic
	name = "Paramedic Dispatch"
	icon_state = "paramedic"

/area/station/medical/office
	name = "Medical Office"
	icon_state = "med_office"

/area/station/medical/surgery/room_c
	name = "Surgery C"
	icon_state = "surgery"

/area/station/medical/surgery/room_d
	name = "Surgery D"
	icon_state = "surgery"

/area/station/medical/break_room
	name = "Medical Break Room"
	icon_state = "med_break"

/area/station/medical/coldroom
	name = "Medical Cold Room"
	icon_state = "kitchen_cold"

/area/station/medical/patients_rooms
	name = "Patients' Rooms"
	icon_state = "patients"

/area/station/medical/patients_rooms/room_a
	name = "Patient Room A"
	icon_state = "patients"

/area/station/medical/patients_rooms/room_b
	name = "Patient Room B"
	icon_state = "patients"

/area/station/medical/virology
	name = "Virology"
	icon_state = "virology"
	flags_1 = CULT_PERMITTED_1

/area/station/medical/morgue
	name = "Morgue"
	icon_state = "morgue"
	ambience_index = AMBIENCE_SPOOKY

/area/station/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/station/medical/pharmacy
	name = "Pharmacy"
	icon_state = "pharmacy"

/area/station/medical/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/station/medical/surgery/room_b
	name = "Surgery B"
	icon_state = "surgery"

/area/station/medical/cryo
	name = "Cryogenics"
	icon_state = "cryo"

/area/station/medical/exam_room
	name = "Exam Room"
	icon_state = "exam_room"

/area/station/medical/genetics
	name = "Genetics Lab"
	icon_state = "genetics"

/area/station/medical/sleeper
	name = "Medbay Treatment Center"
	icon_state = "exam_room"

/area/station/medical/psychology
	name = "Psychology Office"
	icon_state = "psychology"
	mood_bonus = 3
	mood_message = "<span class='nicegreen'>I feel at ease here.\n</span>"
	ambientsounds = list('sound/ambience/aurora_caelus_short.ogg')

/// Security ///

/area/station/security
	name = "Security"
	icon_state = "security"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/security

/area/station/security/main
	name = "Security Office"
	icon_state = "security"

/area/station/security/brig
	name = "Brig"
	icon_state = "brig"

/area/station/security/brig/upper
	name = "Brig Overlook"

/area/station/security/courtroom
	name = "Courtroom"
	icon_state = "courtroom"

/area/station/security/prison
	name = "Prison Wing"
	icon_state = "sec_prison"

/area/station/security/prison/toilet //radproof
	name = "Prison Toilet"
	icon_state = "sec_prison_safe"

/area/station/security/prison/safe //radproof
	name = "Prison Wing Cells"
	icon_state = "sec_prison_safe"

/area/station/security/prison/upper
	name = "Upper Prison Wing"
	icon_state = "prison_upper"

/area/station/security/prison/visit
	name = "Prison Visitation Area"
	icon_state = "prison_visit"

/area/station/security/prison/rec
	name = "Prison Rec Room"
	icon_state = "prison_rec"

/area/station/security/prison/mess
	name = "Prison Mess Hall"
	icon_state = "prison_mess"

/area/station/security/prison/work
	name = "Prison Work Room"
	icon_state = "prison_work"

/area/station/security/prison/shower
	name = "Prison Shower"
	icon_state = "prison_shower"

/area/station/security/prison/workout
	name = "Prison Gym"
	icon_state = "prison_workout"

/area/station/security/prison/garden
	name = "Prison Garden"
	icon_state = "prison_garden"

/area/station/security/processing
	name = "Labor Shuttle Dock"
	icon_state = "sec_processing"

/area/station/security/processing/cremation
	name = "Security Crematorium"
	icon_state = "sec_cremation"

/area/station/security/warden
	name = "Brig Control"
	icon_state = "warden"

/area/station/security/detectives_office
	name = "Detective's Office"
	icon_state = "detective"
	ambientsounds = list('sound/ambience/ambidet1.ogg','sound/ambience/ambidet2.ogg')

/area/station/security/detectives_office/private_investigators_office
	name = "Private Investigator's Office"
	icon_state = "investigate_office"

/area/station/security/range
	name = "Firing Range"
	icon_state = "firingrange"

/area/station/security/execution
	icon_state = "execution_room"

/area/station/security/execution/transfer
	name = "Transfer Centre"
	icon_state = "sec_processing"

/area/station/security/execution/education
	name = "Prisoner Education Chamber"

/area/station/security/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint1"

/area/station/security/checkpoint/auxiliary
	icon_state = "checkpoint_aux"

/area/station/security/checkpoint/escape
	icon_state = "checkpoint_esc"

/area/station/security/checkpoint/supply
	name = "Security Post - Cargo Bay"
	icon_state = "checkpoint_supp"

/area/station/security/checkpoint/engineering
	name = "Security Post - Engineering"
	icon_state = "checkpoint_engi"

/area/station/security/checkpoint/medical
	name = "Security Post - Medbay"
	icon_state = "checkpoint_med"

/area/station/security/checkpoint/science
	name = "Security Post - Science"
	icon_state = "checkpoint_sci"

/area/station/security/checkpoint/science/research
	name = "Security Post - Research Division"
	icon_state = "checkpoint_res"

/area/station/security/checkpoint/customs
	name = "Customs"
	icon_state = "customs_point"

/area/station/security/checkpoint/customs/auxiliary
	icon_state = "customs_point_aux"

/area/ai_monitored/security/armory
	name = "Armory"
	icon_state = "armory"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/security

/area/ai_monitored/security/armory/upper
	name = "Upper Armory"

/// Cargo ///

/area/station/cargo
	name = "Cargo Bay"
	icon_state = "cargo_bay"
	airlock_wires = /datum/wires/airlock/service // TODO: Cargo wires

/area/station/cargo/sorting
	name = "Delivery Office"
	icon_state = "cargo_delivery"

/area/station/cargo/warehouse
	name = "Warehouse"
	icon_state = "cargo_warehouse"

/area/station/cargo/warehouse/upper
	name = "Upper Warehouse"

/area/station/cargo/office
	name = "Cargo Office"
	icon_state = "cargo_office"

/area/station/cargo/qm
	name = "Quartermaster's Office"
	icon_state = "quart_office"

/area/station/cargo/qm/perch
	name = "Quartermaster's Perch"
	icon_state = "quart_perch"

/area/station/cargo/miningdock
	name = "Mining Dock"
	icon_state = "mining"

/area/station/cargo/miningoffice
	name = "Mining Office"
	icon_state = "mining"

/// Science ///

/area/station/science
	name = "Science Division"
	icon_state = "science"
	airlock_wires = /datum/wires/airlock/science

/area/station/science/lab
	name = "Research and Development"
	icon_state = "research"

/area/station/science/xenobiology
	name = "Xenobiology Lab"
	icon_state = "xenobio"

/area/station/science/storage
	name = "Toxins Storage"
	icon_state = "tox_storage"

/area/station/science/test_area
	name = "Toxins Test Area"
	icon_state = "tox_test"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA

/area/station/science/mixing
	name = "Toxins Mixing Lab"
	icon_state = "tox_mix"

/area/station/science/mixing/chamber
	name = "Toxins Mixing Chamber"
	icon_state = "tox_mix_chamber"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA

/area/station/science/genetics
	name = "Genetics Lab"
	icon_state = "geneticssci"

/area/station/science/misc_lab
	name = "Testing Lab"
	icon_state = "tox_misc"

/area/station/science/misc_lab/range
	name = "Research Testing Range"
	icon_state = "tox_range"

/area/station/science/server
	name = "Research Division Server Room"
	icon_state = "server"

/area/station/science/explab
	name = "Experimentation Lab"
	icon_state = "exp_lab"

/area/station/science/robotics
	name = "Robotics"
	icon_state = "robotics"

/area/station/science/robotics/mechbay
	name = "Mech Bay"
	icon_state = "mechbay"

/area/station/science/robotics/lab
	name = "Robotics Lab"
	icon_state = "ass_line"

/area/station/science/research
	name = "Research Division"
	icon_state = "science"

/area/station/science/research/abandoned
	name = "Abandoned Research Lab"
	icon_state = "abandoned_sci"

/area/station/science/nanite
	name = "Nanite Lab"
	icon_state = "nanite"

/// Storage ///

/area/station/storage/tools
	name = "Auxiliary Tool Storage"
	icon_state = "tool_storage"

/area/station/storage/primary
	name = "Primary Tool Storage"
	icon_state = "primary_storage"

/area/station/storage/art
	name = "Art Supply Storage"
	icon_state = "art_storage"

/area/station/storage/tcom
	name = "Telecomms Storage"
	icon_state = "tcom"
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA

/area/station/storage/eva
	name = "EVA Storage"
	icon_state = "eva"

/area/station/storage/emergency/starboard
	name = "Starboard Emergency Storage"
	icon_state = "emergency_storage"

/area/station/storage/emergency/port
	name = "Port Emergency Storage"
	icon_state = "emergency_storage"

/area/station/storage/tech
	name = "Technical Storage"
	icon_state = "aux_storage"

/area/station/storage/mining
	name = "Public Mining Storage"
	icon_state = "mining"

/// AI ///

/area/ai_monitored/storage/satellite
	name = "AI Satellite Maint"
	icon_state = "ai_storage"
	ambience_index = AMBIENCE_DANGER
	airlock_wires = /datum/wires/airlock/ai

	//Turret_protected

/area/ai_monitored/turret_protected
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')
	airlock_wires = /datum/wires/airlock/ai

/area/ai_monitored/turret_protected/ai_upload
	name = "AI Upload Chamber"
	icon_state = "ai_upload"

/area/ai_monitored/turret_protected/ai_upload_foyer
	name = "AI Upload Access"
	icon_state = "ai_upload_foyer"

/area/ai_monitored/turret_protected/ai
	name = "AI Chamber"
	icon_state = "ai_chamber"

/area/ai_monitored/turret_protected/aisat
	name = "AI Satellite"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/exterior
	name = "AI Satellite Exterior"

/area/ai_monitored/turret_protected/aisat/atmos
	name = "AI Satellite Atmos"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/foyer
	name = "AI Satellite Foyer"
	icon_state = "ai_foyer"

/area/ai_monitored/turret_protected/aisat/service
	name = "AI Satellite Service"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat/hallway
	name = "AI Satellite Hallway"
	icon_state = "ai"

/area/ai_monitored/turret_protected/aisat_interior
	name = "AI Satellite Antechamber"
	icon_state = "ai_interior"

/area/ai_monitored/turret_protected/ai_sat_ext_as
	name = "AI Sat Ext"
	icon_state = "ai_sat_east"

/area/ai_monitored/turret_protected/ai_sat_ext_ap
	name = "AI Sat Ext"
	icon_state = "ai_sat_west"
