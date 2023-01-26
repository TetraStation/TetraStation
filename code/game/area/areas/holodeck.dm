/area/special/holodeck
	name = "Holodeck"
	icon_state = "Holodeck"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	flags_1 = NONE
	area_flags = VALID_TERRITORY | UNIQUE_AREA | NOTELEPORT | HIDDEN_AREA

	var/obj/machinery/computer/holodeck/linked
	var/restricted = FALSE // if true, program goes on emag list

/*
	Power tracking: Use the holodeck computer's power grid
	Asserts are to avoid the inevitable infinite loops
*/

/area/special/holodeck/powered(chan)
	if(!requires_power)
		return TRUE
	if(always_unpowered)
		return FALSE
	if(!linked)
		return FALSE
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/special/holodeck))
	return A.powered(chan)

/area/special/holodeck/addStaticPower(value, powerchannel)
	if(!linked)
		return
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/special/holodeck))
	return ..()

/area/special/holodeck/use_power(amount, chan)
	if(!linked)
		return FALSE
	var/area/A = get_area(linked)
	ASSERT(!istype(A, /area/special/holodeck))
	return ..()


/*
	This is the standard holodeck.  It is intended to allow you to
	blow off steam by doing stupid things like laying down, throwing
	spheres at holes, or bludgeoning people.
*/
/area/special/holodeck/rec_center
	name = "\improper Recreational Holodeck"

/area/special/holodeck/rec_center/offline
	name = "Holodeck - Offline"

/area/special/holodeck/rec_center/court
	name = "Holodeck - Empty Court"

/area/special/holodeck/rec_center/dodgeball
	name = "Holodeck - Dodgeball Court"

/area/special/holodeck/rec_center/basketball
	name = "Holodeck - Basketball Court"

/area/special/holodeck/rec_center/thunderdome
	name = "Holodeck - Thunderdome Arena"

/area/special/holodeck/rec_center/beach
	name = "Holodeck - Beach"

/area/special/holodeck/rec_center/lounge
	name = "Holodeck - Lounge"

/area/special/holodeck/rec_center/pet_lounge
	name = "Holodeck - Pet Park"

/area/special/holodeck/rec_center/firingrange
	name = "Holodeck - Firing Range"

/area/special/holodeck/rec_center/school
	name = "Holodeck - Anime School"

/area/special/holodeck/rec_center/chapelcourt
	name = "Holodeck - Chapel Courtroom"

/area/special/holodeck/rec_center/spacechess
	name = "Holodeck - Space Chess"

/area/special/holodeck/rec_center/spacecheckers
	name = "Holodeck - Space Checkers"

/area/special/holodeck/rec_center/kobayashi
	name = "Holodeck - Kobayashi Maru"

/area/special/holodeck/rec_center/winterwonderland
	name = "Holodeck - Winter Wonderland"

/area/special/holodeck/rec_center/photobooth
	name = "Holodeck - Photobooth"

/area/special/holodeck/rec_center/skatepark
	name = "Holodeck - Skate Park"

// Bad programs

/area/special/holodeck/rec_center/medical
	name = "Holodeck - Emergency Medical"
	restricted = TRUE

/area/special/holodeck/rec_center/thunderdome1218
	name = "Holodeck - 1218 AD"
	restricted = TRUE

/area/special/holodeck/rec_center/burn
	name = "Holodeck - Atmospheric Burn Test"
	restricted = TRUE

/area/special/holodeck/rec_center/wildlife
	name = "Holodeck - Wildlife Simulation"
	restricted = TRUE

/area/special/holodeck/rec_center/bunker
	name = "Holodeck - Holdout Bunker"
	restricted = TRUE

/area/special/holodeck/rec_center/anthophila
	name = "Holodeck - Anthophila"
	restricted = TRUE

/area/special/holodeck/rec_center/refuel
	name = "Holodeck - Refueling Station"
	restricted = TRUE
