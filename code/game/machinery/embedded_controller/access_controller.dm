#define CLOSING			1
#define OPENING			2
#define CYCLE			3
#define CYCLE_EXTERIOR	4
#define CYCLE_INTERIOR	5
#define AIRLOCK_CONTROL_RANGE   10

/obj/machinery/door_buttons
	power_channel = AREA_USAGE_ENVIRON
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 4
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/idSelf
	var/safety = TRUE

/obj/machinery/door_buttons/attackby(obj/O, mob/user)
	return attack_hand(user)

/obj/machinery/door_buttons/proc/findObjsByTag()
	return

/obj/machinery/door_buttons/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/door_buttons/LateInitialize()
	findObjsByTag()

/obj/machinery/door_buttons/emag_act(mob/user)
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	req_access = list()
	req_one_access = list()
	safety = FALSE
	playsound(src, "sparks", 100, TRUE)
	to_chat(user, "<span class='warning'>You short out the access controller.</span>")

/obj/machinery/door_buttons/proc/removeMe()


/obj/machinery/door_buttons/access_button
	icon = 'icons/obj/airlock_machines.dmi'
	icon_state = "access_button_standby"
	name = "access button"
	desc = "A button used for the explicit purpose of opening an airlock."
	var/idDoor
	var/obj/machinery/door/airlock/door
	var/obj/machinery/door_buttons/airlock_controller/controller
	var/busy

/obj/machinery/door_buttons/access_button/findObjsByTag()
	for(var/obj/machinery/door_buttons/airlock_controller/A in GLOB.machines)
		if(A.idSelf == idSelf)
			controller = A
			break
	for(var/obj/machinery/door/airlock/I in GLOB.machines)
		if(I.id_tag == idDoor)
			door = I
			break

/obj/machinery/door_buttons/access_button/interact(mob/user)
	if(busy)
		return
	if(!allowed(user))
		to_chat(user, "<span class='warning'>Access denied.</span>")
		return
	if(controller && !controller.busy && door)
		if(controller.machine_stat & NOPOWER)
			return
		busy = TRUE
		update_icon()
		if(door.density)
			if(!controller.exteriorAirlock || !controller.interiorAirlock)
				controller.onlyOpen(door)
			else
				if(controller.exteriorAirlock.density && controller.interiorAirlock.density)
					controller.onlyOpen(door)
				else
					controller.cycleClose(door)
		else
			controller.onlyClose(door)
		sleep(20)
		busy = FALSE
		update_icon()

/obj/machinery/door_buttons/access_button/update_icon_state()
	if(machine_stat & NOPOWER)
		icon_state = "access_button_off"
	else
		if(busy)
			icon_state = "access_button_cycle"
		else
			icon_state = "access_button_standby"

/obj/machinery/door_buttons/access_button/removeMe(obj/O)
	if(O == door)
		door = null

/obj/machinery/door_buttons/airlock_controller
	icon = 'icons/obj/airlock_machines.dmi'
	icon_state = "access_control_standby"
	name = "access console"
	desc = "A small console that can cycle opening between two airlocks."
	var/obj/machinery/door/airlock/interiorAirlock
	var/obj/machinery/door/airlock/exteriorAirlock
	var/idInterior
	var/idExterior
	var/busy
	var/lostPower

/obj/machinery/door_buttons/airlock_controller/removeMe(obj/O)
	if(O == interiorAirlock)
		interiorAirlock = null
	else if(O == exteriorAirlock)
		exteriorAirlock = null

/obj/machinery/door_buttons/airlock_controller/Destroy()
	for(var/obj/machinery/door_buttons/access_button/A in GLOB.machines)
		if(A.controller == src)
			A.controller = null
	return ..()

/obj/machinery/door_buttons/airlock_controller/Topic(href, href_list)
	if(..())
		return
	if(busy)
		return
	if(!allowed(usr))
		to_chat(usr, "<span class='warning'>Access denied.</span>")
		return
	switch(href_list["command"])
		if("close_exterior")
			onlyClose(exteriorAirlock)
		if("close_interior")
			onlyClose(interiorAirlock)
		if("cycle_exterior")
			cycleClose(exteriorAirlock)
		if("cycle_interior")
			cycleClose(interiorAirlock)
		if("open_exterior")
			onlyOpen(exteriorAirlock)
		if("open_interior")
			onlyOpen(interiorAirlock)

/obj/machinery/door_buttons/airlock_controller/proc/onlyOpen(obj/machinery/door/airlock/A)
	if(A)
		busy = CLOSING
		update_icon()
		openDoor(A)

/obj/machinery/door_buttons/airlock_controller/proc/onlyClose(obj/machinery/door/airlock/A)
	if(A)
		busy = CLOSING
		closeDoor(A)

/obj/machinery/door_buttons/airlock_controller/proc/closeDoor(obj/machinery/door/airlock/A)
	if(A.density)
		goIdle()
		return FALSE
	update_icon()
	A.safe = FALSE //Door crushies, manual door after all. Set every time in case someone changed it, safe doors can end up waiting forever.
	A.unbolt()
	if(A.close())
		if(machine_stat & NOPOWER || lostPower || !A || QDELETED(A))
			goIdle(TRUE)
			return FALSE
		A.bolt()
		goIdle(TRUE)
		return TRUE
	goIdle(TRUE)
	return FALSE

/obj/machinery/door_buttons/airlock_controller/proc/cycleClose(obj/machinery/door/airlock/A)
	if(!A || !exteriorAirlock || !interiorAirlock)
		return
	if(exteriorAirlock.density == interiorAirlock.density || !A.density)
		return
	busy = CYCLE
	update_icon()
	if(A == interiorAirlock)
		if(closeDoor(exteriorAirlock))
			busy = CYCLE_INTERIOR
	else
		if(closeDoor(interiorAirlock))
			busy = CYCLE_EXTERIOR

/obj/machinery/door_buttons/airlock_controller/proc/cycleOpen(obj/machinery/door/airlock/A)
	if(!A)
		goIdle(TRUE)
	if(A == exteriorAirlock)
		if(interiorAirlock)
			if(!interiorAirlock.density || !interiorAirlock.locked)
				return
	else
		if(exteriorAirlock)
			if(!exteriorAirlock.density || !exteriorAirlock.locked)
				return
	if(busy != OPENING)
		busy = OPENING
		openDoor(A)

/obj/machinery/door_buttons/airlock_controller/proc/openDoor(obj/machinery/door/airlock/A)
	if(!A)
		goIdle(TRUE)
		return
	if(exteriorAirlock && interiorAirlock && (!exteriorAirlock.density || !interiorAirlock.density))
		goIdle(TRUE)
		return
	A.unbolt()
	INVOKE_ASYNC(src, .proc/do_openDoor, A)

/obj/machinery/door_buttons/airlock_controller/proc/do_openDoor(obj/machinery/door/airlock/A)
	if(A && A.open())
		if(machine_stat | (NOPOWER) && !lostPower && A && !QDELETED(A))
			A.bolt()
	goIdle(TRUE)

/obj/machinery/door_buttons/airlock_controller/proc/goIdle(update)
	lostPower = FALSE
	busy = FALSE
	if(update)
		update_icon()
	updateUsrDialog()

/obj/machinery/door_buttons/airlock_controller/process()
	if(machine_stat & NOPOWER)
		return
	if(busy == CYCLE_EXTERIOR)
		cycleOpen(exteriorAirlock)
	else if(busy == CYCLE_INTERIOR)
		cycleOpen(interiorAirlock)

/obj/machinery/door_buttons/airlock_controller/power_change()
	. = ..()
	if(machine_stat & NOPOWER)
		lostPower = TRUE
	else
		if(!busy)
			lostPower = FALSE

/obj/machinery/door_buttons/airlock_controller/findObjsByTag()
	for(var/obj/machinery/door/airlock/A in GLOB.machines)
		if(A.id_tag == idInterior)
			interiorAirlock = A
		else if(A.id_tag == idExterior)
			exteriorAirlock = A

/obj/machinery/door_buttons/airlock_controller/update_icon_state()
	if(machine_stat & NOPOWER)
		icon_state = "access_control_off"
		return
	if(busy || lostPower)
		icon_state = "access_control_process"
	else
		icon_state = "access_control_standby"

/obj/machinery/door_buttons/airlock_controller/ui_interact(mob/user)
	var/datum/browser/popup = new(user, "computer", name)
	popup.set_content(returnText())
	popup.open()

/obj/machinery/door_buttons/airlock_controller/proc/returnText()
	var/output
	if(!exteriorAirlock && !interiorAirlock)
		return "ERROR: No linked airlocks detected!"
	if(lostPower)
		output = "Initializing..."
	else
		if(!exteriorAirlock || !interiorAirlock)
			if(!exteriorAirlock)
				if(interiorAirlock.density)
					output = "<A href='?src=[REF(src)];command=open_interior'>Open Interior Airlock</A><BR>"
				else
					output = "<A href='?src=[REF(src)];command=close_interior'>Close Interior Airlock</A><BR>"
			else
				if(exteriorAirlock.density)
					output = "<A href='?src=[REF(src)];command=open_exterior'>Open Exterior Airlock</A><BR>"
				else
					output = "<A href='?src=[REF(src)];command=close_exterior'>Close Exterior Airlock</A><BR>"
		else
			if(exteriorAirlock.density)
				if(interiorAirlock.density)
					output = {"<A href='?src=[REF(src)];command=open_exterior'>Open Exterior Airlock</A><BR>
					<A href='?src=[REF(src)];command=open_interior'>Open Interior Airlock</A><BR>"}
				else
					output = {"<A href='?src=[REF(src)];command=cycle_exterior'>Cycle to Exterior Airlock</A><BR>
					<A href='?src=[REF(src)];command=close_interior'>Close Interior Airlock</A><BR>"}
			else
				if(interiorAirlock.density)
					output = {"<A href='?src=[REF(src)];command=close_exterior'>Close Exterior Airlock</A><BR>
					<A href='?src=[REF(src)];command=cycle_interior'>Cycle to Interior Airlock</A><BR>"}
				else
					output = {"<A href='?src=[REF(src)];command=close_exterior'>Close Exterior Airlock</A><BR>
					<A href='?src=[REF(src)];command=close_interior'>Close Interior Airlock</A><BR>"}


	output = {"<B>Access Control Console</B><HR>
				[output]<HR>"}
	if(exteriorAirlock)
		output += "<B>Exterior Door: </B> [exteriorAirlock.density ? "closed" : "open"]<BR>"
	if(interiorAirlock)
		output += "<B>Interior Door: </B> [interiorAirlock.density ? "closed" : "open"]<BR>"

	return output

/*******************************************************************************
			The all-new pod-door controller

       `idSelf` must match, between the controller and all linked buttons.
*******************************************************************************/

/obj/machinery/door_buttons/airlock_controller/poddoor
	name = "pod-bay access console"
	desc = "A small console that can cycle opening of pod-bay airlocks"
	var/obj/machinery/door/poddoor/interiorDoors[0]
	var/obj/machinery/door/poddoor/exteriorDoors[0]
	var/error
	var/frequency
	var/datum/radio_frequency/radio_connection

/obj/machinery/door_buttons/airlock_controller/poddoor/removeMe(obj/O)
	if(O in interiorDoors)
		interiorDoors -= O
	if(O in exteriorDoors)
		exteriorDoors -= O

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	if(new_frequency)
		frequency = new_frequency
		radio_connection = SSradio.add_object(src, frequency, RADIO_AIRLOCK)

/obj/machinery/door_buttons/airlock_controller/poddoor/Destroy()
	if(frequency)
		SSradio.remove_object(src, frequency)
	for(var/obj/machinery/door_buttons/access_button/poddoor/C in GLOB.machines)
		if(C.controller == src)
			C.controller = null
	return ..()

/obj/machinery/door_buttons/airlock_controller/poddoor/LateInitialize()
	syncDoors()
	set_frequency(frequency)

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/doorError()
	error = TRUE
	playsound(src, 'sound/machines/buzz-two.ogg', 50, FALSE, 3)

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/syncDoors()
	for(var/obj/machinery/door/poddoor/D in GLOB.machines)
		if(D.id == idExterior)
			exteriorDoors += D
		if(D.id == idInterior)
			interiorDoors += D

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/exteriorClosed()
	for(var/obj/machinery/door/poddoor/D in exteriorDoors)
		if(!D.density)
			return FALSE // If even one is open, then there's no point checking 'em all.
	return TRUE

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/interiorClosed()
	for(var/obj/machinery/door/poddoor/D in interiorDoors)
		if(!D.density)
			return FALSE
	return TRUE

/obj/machinery/door_buttons/airlock_controller/poddoor/examine(user)
	. = ..()
	if(lostPower)
		. += "It doesn't appear to be powered."
		return
	if(error)
		. += "A tiny, red service light is illuminated on the control panel."
		. += "...surely that should be a bit bigger, so you can see it better?"

	. += "The control panel reports that the exterior doors are [exteriorClosed() ? "closed" : "open"]"
	. += "the interior doors are [interiorClosed() ? "closed" : "open"]"

/obj/machinery/door_buttons/airlock_controller/poddoor/ui_interact(mob/user, datum/tgui/ui)
	if(!allowed(user))
		to_chat(user, "<span class='warning'>Access denied.</span>")
		return
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Podbay")
		ui.open()

/obj/machinery/door_buttons/airlock_controller/poddoor/ui_data()
	var/list/data = list(
		"exteriorClosed" = exteriorClosed(),
		"interiorClosed" = interiorClosed(),
		"busy" = busy,
		"error" = error
	)
	return data

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/openDoors(list/obj/machinery/door/poddoor/D)
	if(!D || !(D.len > 0))
		return
	for(var/obj/machinery/door/poddoor/I in D)
		if(lostPower || !I || QDELETED(I) || error)
			// Oopsie
			doorError()
			break
		else
			I.unlock()
			I.open()
			I.lock()

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeDoors(list/obj/machinery/door/poddoor/D)
	if(!D || !(D.len > 0))
		return
	for(var/obj/machinery/door/poddoor/I in D)
		if(lostPower || !I || QDELETED(I) || error)
			// Oh dear.
			doorError()
			break

		I.safe = FALSE	// Prevents delays by someone standing underneath one and making it take
				// forever to close. Don't stand underneath them.
		I.unlock()
		if(I.close())
			I.lock()
		else
			error = TRUE

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/openInside(var/override)
	if(!interiorClosed())
		return TRUE
	busy = OPENING
	update_icon()
	playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
	if(!exteriorClosed() && safety && !override)
		busy = CYCLE_INTERIOR
		update_icon()
		say("Stand clear, exterior doors closing.")
		sleep(1)
		closeDoors(exteriorDoors)
		sleep(1)
		if(!exteriorClosed() && safety && !override)
			busy = FALSE
			doorError()
			return FALSE
	sleep(1)
	playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
	say("Stand clear, interior doors opening.")
	openDoors(interiorDoors)
	sleep(1)
	busy = FALSE
	update_icon()

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeInside(var/override)
	busy = CLOSING
	say("Caution, interior doors closing.")
	playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
	sleep(1)
	// No requirement for a safety check here, because closing a door will always
	// leave the airlock in a safe state, regardless of the state of the other door...
	closeDoors(interiorDoors)
	sleep(2)
	if(!interiorClosed() && safety && !override)
		// ... so long as it actually closes.
		doorError()
	busy = FALSE

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/openOutside(var/override)
	if(!exteriorClosed())
		return TRUE
	busy = OPENING
	update_icon()
	if(!interiorClosed() && safety && !override)
		busy = CYCLE_EXTERIOR
		update_icon()
		say("Stand clear, interior doors closing.")
		playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
		sleep(1)
		closeDoors(interiorDoors)
		sleep(1)
		if(!interiorClosed() && safety && !override)
			busy = FALSE
			doorError()
			return FALSE
	sleep(1)
	playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
	openDoors(exteriorDoors)
	busy = FALSE
	update_icon()


/obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeOutside(var/override)
	busy = CLOSING
	update_icon()
	playsound(src, 'sound/machines/warning-buzzer.ogg', 10, FALSE)
	say("Caution, exterior doors closing.")
	sleep(1)
	// No requirement for a safety check here, because closing a door will always
	// leave the airlock in a safe state, regardless of the state of the other door...
	closeDoors(exteriorDoors)
	sleep(1)
	if(!exteriorClosed() && safety && !override)
		// ... so long as it actually closes.
		doorError()

	busy = FALSE
	update_icon()

/obj/machinery/door_buttons/airlock_controller/poddoor/proc/cycleDoors()
	// Maintains the automatic cycle of one open/one close, and a delay for safety
	// between them, with one push of a button! If both sides are closed, it opens
	// the inner first.
	if(interiorClosed())
		busy = CYCLE_INTERIOR
		update_icon()
		openInside()
	else
		busy = CYCLE_EXTERIOR
		update_icon()
		openOutside()
	sleep(3)
	busy = FALSE
	update_icon()

/obj/machinery/door_buttons/airlock_controller/poddoor/ui_act(action, params)
	if(..())
		return
	if(busy)
		return

	update_icon()

	switch(action)
		if("open_interior")
			INVOKE_ASYNC(src, /obj/machinery/door_buttons/airlock_controller/poddoor/proc/openInside)
		if("close_interior")
			INVOKE_ASYNC(src, /obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeInside)
		if("open_exterior")
			INVOKE_ASYNC(src, /obj/machinery/door_buttons/airlock_controller/poddoor/proc/openOutside)
		if("close_exterior")
			INVOKE_ASYNC(src, /obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeOutside)
		if("cycle")
			INVOKE_ASYNC(src, /obj/machinery/door_buttons/airlock_controller/poddoor/proc/cycleDoors)
	. = TRUE
	return

/obj/machinery/door_buttons/airlock_controller/poddoor/receive_signal(datum/signal/signal)
	. = ..()
	if(!signal)
		return
	var/received_id   = signal.data["whoami"]
	var/received_side = signal.data["doorSide"]

	if(received_id != idSelf)
		return // Signal isn't for us. Ignore it.

	if(signal.data["unsafety"])
		safety = FALSE // Receiving a signal from an emagged button, sets the controller to unsafe

	switch(received_side)
		if("internal")
			if(interiorClosed())
				INVOKE_ASYNC(src,\
					/obj/machinery/door_buttons/airlock_controller/poddoor/proc/openInside)
			else
				INVOKE_ASYNC(src,\
					/obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeInside)
			return
		if("external")
			if(exteriorClosed())
				INVOKE_ASYNC(src,\
					/obj/machinery/door_buttons/airlock_controller/poddoor/proc/openOutside)
			else
				INVOKE_ASYNC(src,\
					/obj/machinery/door_buttons/airlock_controller/poddoor/proc/closeOutside)
			return
	. = TRUE


// Variant of Access Button for controlling a bank of pod-doors
/obj/machinery/door_buttons/access_button/poddoor
	name = "pod-bay access button"
	desc = "A button used for the explicit purpose of opening a pod-bay door, HAL"
	var/doorSide
	var/obj/machinery/door_buttons/airlock_controller/poddoor/podController
	var/unsafe = FALSE
	var/frequency
	var/datum/radio_frequency/radio_connection

/*
	doorSide: "internal" or "external"

	idSelf: set to the id of the controller responsible for these
	doors. e.g. if it's the mechbay airlock, and the controller
	has the id "mechbay_airlock_controller", then that's what goes
	here.

*/

/obj/machinery/door_buttons/access_button/poddoor/Initialize()
	. = ..()
	for(var/obj/machinery/door_buttons/airlock_controller/poddoor/C in GLOB.machines)
		if(C.idSelf == idSelf)
			podController = C
			break
	set_frequency(frequency)

/obj/machinery/door_buttons/access_button/poddoor/proc/set_frequency(new_frequency)
	SSradio.remove_object(src, frequency)
	frequency = new_frequency
	radio_connection = SSradio.add_object(src, frequency, RADIO_AIRLOCK)

/obj/machinery/door_buttons/access_button/poddoor/examine(user)
	. = ..()
	if(machine_stat & NOPOWER)
		. += "It doesn't appear to be powered."
	if(podController && radio_connection)
		if(podController.lostPower || !podController.safety || unsafe)
			. += "A small red light with a wrench icon is lit."
	else
		. += "A small yellow light with the word 'SYNC' is lit"

/obj/machinery/door_buttons/access_button/poddoor/emag_act(mob/user)
	..()
	unsafe = TRUE // Override the safety on controller actions.

/obj/machinery/door_buttons/access_button/poddoor/interact(mob/user)
	if(!allowed(user))
		to_chat(user, "<span class='warning'>Access denied.</span>")
		playsound(src, 'sound/machines/deniedbeep.ogg', FALSE, 3)
		return

	if(!podController || !doorSide)
		to_chat(user, "<span class='info'>a small red light, with a wrench icon, lights up on [src].")
		return

	if(busy)
		say("Please wait...")

	if(!podController.busy)
		if(podController.lostPower)
			to_chat(user, "<span class='info'>a small red light, with a wrench icon, lights up on [src].")
			return
		busy = TRUE
		update_icon()

		if(radio_connection)
			// Send simple radio signal with our idSelf and doorside, on our set frequency.
			var/datum/signal/signal = new(list("whoami" = idSelf,
				"doorSide" = doorSide, "unsafety" = unsafe))

			radio_connection.post_signal(src, signal, range = AIRLOCK_CONTROL_RANGE, \
				filter = RADIO_AIRLOCK)
	else
		playsound(src, 'sound/machines/buzz-two.ogg', FALSE, 3)

	busy = FALSE
	update_icon()



#undef AIRLOCK_CONTROL_RANGE
#undef CLOSING
#undef OPENING
#undef CYCLE
#undef CYCLE_EXTERIOR
#undef CYCLE_INTERIOR
