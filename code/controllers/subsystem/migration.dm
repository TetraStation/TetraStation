/*
	STUB: A stub migration subsystem for the time being
	To be replaced with a proper one later.
*/

/*
	Migration Subsystem - Based on Discordia/CEV Eris system

	It handles burrows and the movements of various NPC mobs
	throughout the station.

	It allows mobs to move between burrows, dispatches
	reinforcements to distress calls from mobs under attack, and
	keeps track of all the burrows, negating any need for them to
	process individually (most of the time).

	This subsystem also handles spreading plants through burrows.
*/

var/list/global/all_burrows = list()
var/list/global/populated_burrows = list()
var/list/global/unpopulated_burrows = list()
var/list/global/distressed_burrows = list()

SUBSYSTEM_DEF(migration)
	name = "Migration"
	init_order = INIT_ORDER_DEFAULT

	wait = 300 // Ticks once per 30 seconds
							// Every set interval:
	var/burrow_scan_interval = 5 MINUTES		// * Scan and catalogue lifeforms around burrows
	var/burrow_plantspread_interval = 10 MINUTES	// * Plants near burrows will spread through them.
	var/burrow_migrate_interval = 10 MINUTES	// * Some mobs will move from a populated burrow to
							//   a different place.

	var/next_scan = 0 // Do a scan as soon as the round starts.
	var/next_migrate = 10 MINUTES
	var/next_plantspread = 10 MINUTES

	// Chance, during each migration, for mobs to move from a populated burrow to somewhere else
	var/migrate_chance = 15
	var/roundstart_burrows = 30 // Keeping this fairly low for now, as maps here are smaller than Eris.

	// How long does it take for mobs to move from one burrow to another
	var/migrate_time = 80 SECONDS

	// How long does it take for reinforcements to arrive?
	var/reinforcement_time = 20 SECONDS

	// How many other burrows will plants be spread to?
	var/plantspread_burrows_num = 3


/*************************************************
   Burrow Creation
*************************************************/

// On initialisation, generate a large number of burrows spread
// throughout the station

//datum/controller/subsystem/migration/Initialise()


// Called by roaches when they spawn.  Attempts to create a burrow
// against a wall, within the view of the target location.

/proc/create_burrow(var/turf/target)
	// Check whether we're on the station.

	// Get a list of everything in dview (View, ignoring darkness;
	// since we're probably going to be creating this in a dark maint
	// tunnel.

	// Then, look at all the floors.

	// Reject any locations under a wall.

	// Reject any location that already has a burrow.

	// Reject any location with an airlock

	// Reject a location with ladders or stairs

	// Reject a location if it's in space.

	// Check for a wall in a cardinal direction
	// If it's got a wall, put that floor and its wall into the list of possible turfs.

	// Check whether the list of possible turfs has at least one
	// option. Just in case we're trying to do this in a room with no
	// floor because it's made out of catwalks.

	// When we have a list of viable floors in view, pick one.

	// And create a burrow there, passing in the associated wall
	// as its anchor.

	return

// Look for a burrow, create one if an existing one isn't found.
/proc/find_or_create_burrow(var/turf/target)
	if(find_visible_burrow(target))
		return TRUE

	create_burrow(target)
	return FALSE

/datum/controller/subsystem/migration/fire()
	// Life scanning
	if(world.time > next_scan)
		do_scan()

	if(distressed_burrows.len)
		handle_distress_calls()

	if(world.time > next_migrate)
		do_migrate()

	if(world.time > next_plantspread)
		do_plant_spread()

// Tell all the burrows to refresh their population lists.
/datum/controller/subsystem/migration/proc/do_scan()
	return

// Some of the populated holes will migrate part, or all, of
// their population into a new burrow.
/datum/controller/subsystem/migration/proc/do_migrate()
	return

// Sends reinforcements to any burrow that has requested backup
/datum/controller/subsystem/migration/proc/handle_distress_calls()
	return

// Pick a destination for migrating mobs.
// High chance to re-roll burrows that are outside of maintenance areas,
// to minimise incursions into crew-space.
/datum/controller/subsystem/migration/proc/choose_burrow_target(var/obj/structure/burrow/source, var/reroll_type = TRUE, var/reroll_prob = 99.5)
	return

// Pick a source to pull reinforcements from. (Used for distress calls.)
/datum/controller/subsystem/migration/proc/choose_burrow_source()
	return

/datum/controller/subsystem/migration/proc/migration_percentage()
	if (prob(20))
		return 1 // Significant chance to move the entire population of the burrow
	return rand()


/*************************************************
Plant Handling
*************************************************/

// Allows plants to spread through burrows, if they're so inclined.
// Run every 10 minutes
/datum/controller/subsystem/migration/proc/do_plant_spread()
	return

// Finds burrows near the specified one, and sends plants from it to them.
/datum/controller/subsystem/migration/proc/spread_plants_from(var/obj/structure/burrow/B)
	return

/*************************************************
Burrow Finding and Sorting
*************************************************/

// Things hidden under floors don't show in some view/range calls.
// To work around this, use these procs to locate nearby burrows.

// Nearest burrow
/proc/find_nearby_burrow(var/atom/target, var/dist = 10)
	return

// List of nearest burrows
/proc/find_nearby_burrows(var/atom/target, var/dist = 10)
	return

// Nearest visible burrow
/proc/find_visible_burrow(var/atom/target, var/dist = 10)
	return

// List of nearest visible burrows
/proc/find_visible_burrows(var/atom/target, var/dist = 10)
	return

// A list of all burrows, sorted in ascending order of distance
// from the source atom
/proc/get_sorted_burrow_network(var/atom/source)
	return
