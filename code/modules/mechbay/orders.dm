GLOBAL_LIST_EMPTY(work_orders_list)

// Very much like bounties, at least for now.
/datum/work_order
	var/name
	var/description
	var/payment = 5000 // In credits
	var/completed = FALSE
	var/high_priority = FALSE
	var/secure = FALSE // If an order for a secure item, then it *needs* to go on the drop-ship.
	// Non-secure items can go either by drop-ship or by the regular cargo shuttle.
	// Perhaps there should be a cost for sending non-secure items by the drop-ship?
	var/fucked_up = FALSE

// Displayed on the mechbay console.
// How much will the department get paid for completing this WO?
/datum/work_order/proc/payment_string()
	return "[payment] Credits"

/datum/work_order/proc/can_complete()
	return !completed

// If an item in the shuttle (or drop-ship) can satisfy the work order.
/datum/work_order/proc/applies_to(obj/O)
	return FALSE

// When an object is shipped on the cargo shuttle.
/datum/work_order/proc/ship(obj/O)
	return

// When an object is shipped via the drop-ship
/datum/work_order/proc/ship_secure(obj/O)
	return

/datum/work_order/proc/mark_high_priority(scale_payment = 2)
	if(high_priority)
		return
	high_priority = TRUE
	payment = round(payment * scale_payment)


/datum/work_order/proc/mark_secure()
	if(secure)
		return
	secure = TRUE


/* Called when the shuttle docks at CentCom. Handles items shipped for work-orders.

   Items for 'secure' work-orders attract punishment when shipped via
   the standard cargo shuttle. (After all, you'd expect someone to be
   Big Mad if you were making parts for the military that they
   demanded be sent by armed courier, and you just chucked it in a
   padded envelope and stuffed it in the mailbox.)

   Do it enough times, and maybe CentCom sends a Strongly Worded
   Letter to the station.
*/
/proc/work_order_ship_item_and_contents(atom/movable/AM, dry_run=FALSE, secure=FALSE)
	if(!GLOB.work_orders_list.len)
		setup_work_orders()

	var/list/matched_one = FALSE
	for(var/thing in reverseRange(AM.GetAllContents()))
		var/matched_this = FALSE
		for(var/datum/work_order/W in GLOB.work_orders_list)
			if(W.applies_to(thing))
				matched_one = TRUE
				matched_this = TRUE
				if(W.secure && !secure)
					// Uhoh, someone did a fucky wucky
					W.fucked_up = TRUE
					// Stamp the work-order with a violation,
					// or something
				W.ship(thing)
		if(matched_this)
			qdel(thing)
	return matched_one

// Called at startup, to populate GLOB.mb_work_orders_list with some
// random work-orders.
/proc/setup_work_orders()
	return

/proc/completed_work_order_count()
	var/count = 0
	for(var/i in GLOB.work_orders_list)
		var/datum/work_order/W = i
		if(W.completed)
			++count
	return count

/proc/fucked_up_work_order_count()
	var/count = 0
	for(var/i in GLOB.work_orders_list)
		var/datum/work_order/W = i
		if(W.fucked_up)
			++count
	return count
