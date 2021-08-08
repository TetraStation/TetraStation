/*
 * Military-themed drop/cargo ship point for TerraGov transport stuff.
*/

/obj/docking_port/mobile/dropship
	name = "marine dropship"
	id   = "dropship"

	callTime = 600

	dir = WEST
	port_direction = EAST
	width = 8
	dwidth = 4
	height = 12
	movement_force = list("KNOCKDOWN" = 3, "THROW" = 1) // Rough ride expected.

/obj/docking_port/mobile/dropship/register()
	. = ..()
//	SSshuttle.dropship = src

/obj/docking_port/mobile/dropship/canMove()
	if(is_station_level(z))
		return check_blastlist(shuttle_areas)
	return ..()

/*
 * Check for FORBIDDEN ITEMS aboard this shuttle. Probably needs to be a
 * different list to the standard cargo-shuttle forbid-list.
*/
/obj/docking_port/mobile/dropship/proc/check_blastlist(areaInstances)
	for(var/place in areaInstances)
		var/area/shuttle/shuttle_area = place
		for(var/turf/trf in shuttle_area)
			for(var/a in trf.GetAllContents())
				if(is_type_in_typecache(a, GLOB.blacklisted_cargo_types) && !istype(a, /obj/docking_port))
					return FALSE
	return TRUE


/obj/docking_port/mobile/dropship/request(obj/docking_port/stationary/S)
	if(mode != SHUTTLE_IDLE)
		return 2 // ?
	return ..()

/obj/docking_port/mobile/dropship/initiate_docking()
	if(getDockedId() == "dropship_away")
		// Leaving Cent-Com
		// Anything we're taking to the station, needs to be added now.
		loadUp()
	. = ..() // Fly/enter transit
	if(. != DOCKING_SUCCESS)
		return
	if(getDockedId() == "dropship_away")
		// Arriving back at Cent-Com
		// Deliver all our items.
		unLoad()

/obj/docking_port/mobile/dropship/proc/loadUp()

	// What available space is there to put items?
	var/list/empty_turfs = list()
	for(var/place in shuttle_areas)
		var/area/shuttle/shuttle_area = place
		for(var/turf/open/floor/T in shuttle_area)
			if(T.is_blocked_turf())
				continue
			empty_turfs += T

	for(var/datum/work_order/WO in GLOB.work_orders_list)
		if(!empty_turfs.len)
			break // Nowhere to put a crate or whatnot

/obj/docking_port/mobile/dropship/proc/unLoad()
	var/msg = ""
	var/matched_WO = FALSE
	for(var/area/shuttle/place in shuttle_areas)
		for(var/atom/movable/AM in place)
			if(iscameramob(AM))
				continue
			if(work_order_ship_item_and_contents(AM, dry_run = FALSE, secure = TRUE))
				matched_WO = TRUE
	if(matched_WO)
		msg += "Ordered items received. The work-order has been updated. Payment will be transferred as usual."

	investigate_log("Dropship contents unloaded. Message: [msg || "none."]", INVESTIGATE_CARGO)
