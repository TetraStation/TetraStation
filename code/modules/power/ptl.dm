// The Power-Transfer Laser
// Takes in power from the grid, turns it into a big laser o' doom
// that Engineering gets paid for by the kWh transmitted.

// More watts, more money, honey~

#define CHGRATE 0.1

/obj/machinery/power/ptl
	name = "power transfer laser"
	desc = "A high-power laser, used for transmitting power long distances."
	icon = 'icons/obj/power_transfer.dmi'
	icon_state = "laser"

	anchored = TRUE
	density = TRUE

	use_power = IDLE_POWER_USE
	power_channel = AREA_USAGE_EQUIP
	req_access = list(ACCESS_ENGINE_EQUIP)
	idle_power_usage = 50
	active_power_usage = 50000

//	circuit = /obj/item/circuitboard/machine/ptl


	var/capacity = 5e6
	var/charge = 0

	var/kw_xmitted	// How many lifetime kW have we blasted into space?
	var/efficiency = 0.60	// By default, 60% efficient at turning power into LAZOR.
				// Rest of it heats up the room around the PTL.
				// Efficiency can be increased by upgrades, eventually

	var/transmit_active = FALSE	// !!LAZOR!! switch default
	var/transmitting = FALSE	// Is the laser actually sending power?
	var/transmit_level = 50000	// How much we're going to blast out.
	var/transmit_level_max = 1000000	// Cap on our output. (Maybe a mechanism to exceed this?)

	var/charge_en = TRUE		// Charge switch default
	var/charging  = FALSE		// Are we actually charging?
	var/input_level = 50000		// How much we're going to charge by
	var/input_level_max = 1000000	// Cap on input level.
	var/input_available = 0		// Amount of charge available from input last tick

	// What terminal are we connected to?
	var/obj/machinery/power/terminal/terminal = null

	// Where is our emitter outputting, and where is it pointed at?
	var/turf/emitter_out
	var/turf/target

/obj/machinery/power/ptl/examine(user)
	. = ..()
	if(!terminal)
		. += "This laser isn't connected to a power terminal. That's not terribly useful."
	if(!terminal.powered())
		. += "It doesn't appear to have any power."
	if(charge > 0)
		. += "The display shows its state of charge."
	else
		. += "The display has a warning about no stored charge."

	if(transmit_active)
		. += pick("The arming switch is enabled", "Ooh, shiny red button!", "It is transmitting.")
	else
		. += pick("The arming switch is off", "It is not set to transmit.")

/obj/machinery/power/ptl/Initialize()
	. = ..()
	dir_loop:
		for(var/d in GLOB.cardinals)
			var/turf/T = get_step(src, d)
			for(var/obj/machinery/power/terminal/term in T)
				if(term && term.dir == turn(d, 180))
					terminal = term
					break dir_loop
	if(!terminal)
		obj_break()
		return
	terminal.master = src
	terminal.connect_to_network()
	connect_to_network()
	update_icon()
	emitter_out = get_front_turf()
	target = get_target_turf()

/obj/machinery/power/ptl/CtrlClick(mob/user)
	if(can_interact(user))
		transmit_active = !transmit_active
		investigate_log("was turned [transmit_active ? "on" : "off"] by [key_name(user)]", INVESTIGATE_SINGULO)
		update_icon()
	return ..()

/obj/machinery/power/ptl/AltClick(mob/user)
	if(can_interact(user))
		transmit_level = transmit_level_max
		investigate_log("was turned to maximum transmit power by [key_name(user)]", INVESTIGATE_SINGULO)
		update_icon()
	return ..()


/obj/machinery/power/ptl/attackby(obj/item/I, mob/user, params)
	// Opening with a screwdriver
	if(default_deconstruction_screwdriver(user, "[initial(icon_state)]-open", initial(icon_state), I))
		update_icon()
		return

	// Change direction with a wrench
	if(default_change_direction_wrench(user, I))
		terminal = null
		var/turf/T = get_step(src, dir)
		for(var/obj/machinery/power/terminal/term in T)
			if(term && term.dir == turn(dir, 180))
				terminal = term
				terminal.master = src
				to_chat(user, "<span class='notice'>Terminal found.</span>")
				break
		if(!terminal)
			to_chat(user, "<span class='alert'>No power terminal found.</span>")
			return
		set_machine_stat(machine_stat & ~BROKEN)
		update_icon()
		return

	// Crowbarring
	var/turf/T = get_turf(src)
	if(default_deconstruction_crowbar(I))
		message_admins("[src] has been deconstructed by [ADMIN_LOOKUPFLW(user)] in [ADMIN_VERBOSEJMP(T)]")
		log_game("[src] has been deconstructed by [key_name(user)] at [AREACOORD(src)]")
		investigate_log("PTL deconstructed by [key_name(user)] at [AREACOORD(src)]", INVESTIGATE_SINGULO)
		return
	else if(panel_open && I.tool_behaviour == TOOL_CROWBAR)
		return

	return ..()


/obj/machinery/power/ptl/Destroy()
	if(SSticker.IsRoundInProgress())
		var/turf/T = get_turf(src)
		message_admins("PTL deleted at [ADMIN_VERBOSEJMP(T)]")
		log_game("PTL deleted at [AREACOORD(T)]")
		investigate_log("<font color='red'>deleted</font> at [AREACOORD(T)]", INVESTIGATE_SINGULO)
	if(terminal)
		disconnect_terminal()
	return ..()

// Create a terminal object pointing towards the PTL
// Wires attach here.

/obj/machinery/power/ptl/proc/make_terminal(turf/T)
	terminal = new/obj/machinery/power/terminal(T)
	terminal.setDir(get_dir(T, src))
	terminal.master = src
	set_machine_stat(machine_stat & ~BROKEN)

/obj/machinery/power/ptl/disconnect_terminal()
	if(terminal)
		terminal.master = null
		terminal = null
		obj_break()

/obj/machinery/power/ptl/update_overlays()
	. = ..()
	if(machine_stat & BROKEN)
		icon_state = "laser-broken"
		return

	if(panel_open)
		return

	if(transmit_active)
		// Red light lit on the control panel
		. += "laser_armed"
	else
		. += "laser_disarmed"

	if(transmitting)
		. += "laser_transmit"
	else
		. -= "laser_transmit"

	if(charge_en)
		// Green light lit on the control panel
		. += "laser_charge"
	else
		. += "laser_charge_no"

	if(charging)
		// Orange light on the control panel
		. += "laser_charging"
	else
		. += "laser_charging_no"

/obj/machinery/power/ptl/process()
	if(machine_stat & BROKEN)
		return PROCESS_KILL

	if(machine_stat & NOPOWER)
		charging = FALSE

	var/output_used

	if(terminal && terminal.powered())
		input_available = terminal.avail()

		if(charge_en && (charge < capacity))
			if(input_available > 0)
				// Power available, try to charge at a rate-limited amount. (The more charge
				// we have stored, the slower the charging goes.)
				var/load = min(min((capacity - charge)/CHGRATE, input_level), input_available)
				charge += load * CHGRATE
				charging = TRUE
				terminal.add_load(load)
			else
				// No power available, turn off the charging light.
				charging = FALSE
		else
			// Charging disabled by user, or we're fully charged.
			charging = FALSE
	else
		// Not connected to power.
		charge_en = FALSE

	// Output time! This is where it gets interesting.
	if(transmit_active && (charge > 0))
		if(transmitting)
			var/lazed
			output_used = (min(transmit_level, charge) * CHGRATE)
			charge -= output_used
			lazed = output_used * efficiency

			// Energy added to environment as waste heat = (output_used - lazed)
			var/turf/L = loc
			if(!istype(L))
				transmit_active = FALSE
				charge_en = FALSE
				update_icon()
				return
			var/datum/gas_mixture/env = L.return_air()
			var/heat_capacity = env.heat_capacity()
			var/deltatemperature = ((output_used - lazed)/heat_capacity)
			if(deltatemperature)
				env.temperature += deltatemperature
				air_update_turf()
				// Make shit warmer.
			kw_xmitted += (round (lazed / 1000))

			// Lazor output would go here, using 'lazed' as its carried power for anything
			// that needs to know how much energy it's been hit by.
			// (e.g. for damage/gibbing/incineration threshold)

		else if(transmit_active && charge > transmit_level && transmit_level > 0)
			transmitting = TRUE
		else
			output_used = 0
	else
		transmitting = FALSE

	update_icon()
	return

/obj/machinery/power/ptl/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Ptl")
		ui.open()

/obj/machinery/power/ptl/ui_data()
	var/list/data = list(
		"capacity" = capacity,
		"chargePercent" = round(100*charge/capacity, 0.1),
		"charge" = charge,
		"chargeEnabled" = charge_en,
		"charging" = charging,
		"inputLevel" = input_level,
		"inputLevel_text" = DisplayPower(input_level),
		"inputLevelMax" = input_level_max,
		"inputAvailable" = DisplayPower(input_available),
		"kwTransmitted" = DisplayPower(kw_xmitted*1000),
		"transmitEnabled" = transmit_active,
		"transmitting" = transmitting,
		"outputLevel" = transmit_level,
		"outputLevel_text" = DisplayPower(transmit_level),
		"outputLevelMax" = transmit_level_max
	)
	return data

/obj/machinery/power/ptl/ui_act(action, params)
	if(..())
		return
	switch(action)
		if("tryinput")
			charge_en = !charge_en
			log_ptl(usr)
			update_icon()
			. = TRUE
		if("tryoutput")
			transmit_active = !transmit_active
			log_ptl(usr)
			update_icon()
			. = TRUE
		if("input")
			var/target = params["target"]
			var/adjust = text2num(params["adjust"])
			if(target == "min")
				target = 0
				. = TRUE
			else if(target == "max")
				target = input_level_max
				. = TRUE
			else if(adjust)
				target = input_level + adjust
				. = TRUE
			else if(text2num(target) != null)
				target = text2num(target)
				. = TRUE
			if(.)
				input_level = clamp(target, 0, input_level_max)
				log_ptl(usr)
		if("output")
			var/target = params["target"]
			var/adjust = text2num(params["adjust"])
			if(target == "min")
				target = 0
				. = TRUE
			else if(target == "max")
				target = transmit_level_max
				. = TRUE
			else if(adjust)
				target = transmit_level + adjust
				. = TRUE
			else if(text2num(target) != null)
				target = text2num(target)
				. = TRUE
			if(.)
				transmit_level = clamp(target, 0, transmit_level_max)
				log_ptl(usr)

/obj/machinery/power/ptl/proc/log_ptl(mob/user)
	return

/obj/machinery/power/ptl/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	charge_en = rand(0,1)
	charging = charge_en
	transmit_active = rand(0,1)
	transmitting = transmit_active
	transmit_level = rand(0, transmit_level_max)
	input_level = rand(0, input_level_max)
	charge -= 1e6/severity
	if(charge < 0)
		charge = 0
	update_icon()
	log_ptl()

/obj/machinery/power/ptl/proc/get_target_turf()
	switch(dir)
		if(NORTH)
			return locate(x, world.maxy, z)
		if(SOUTH)
			return locate(x, 1, z)
		if(EAST)
			return locate(world.maxx, y, z)
		if(WEST)
			return locate(1, y, z)
	return get_turf(src)

/obj/machinery/power/ptl/proc/get_front_turf()
	switch(dir)
		if(NORTH)
			return locate(x, y + 1, z)
		if(SOUTH)
			return locate(x, y - 1, z)
		if(EAST)
			return locate(x + 1, y, z)
		if(WEST)
			return locate(x-1, y, z)
	return get_turf(src)


/obj/item/book/manual/ptl_operation
        name = "Power Transfer Laser manual"
        icon_state ="book"
        author = "Applied Power Dynamics Inc"
        title = "Mk 3 Power Transfer Laser: Operation and Maintenance"
        dat = {"<html>
                <head>
                <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
                <style>
                h1 {font-size: 18px; margin: 15px 0px 5px;}
                h2 {font-size: 15px; margin: 15px 0px 5px;}
                li {margin: 2px 0px 2px 15px;}
                ul {list-style: none; margin: 5px; padding: 0px;}
                ol {margin: 5px; padding: 0px 15px;}
                </style>
                </head>
                <body>
                <center>
                <b style='font-size: 12px;'>Applied Power Dynamics Inc.</b>
                <h1>Mk 3 Power Transfer Laser</h1>
		<h2>Operation and Maintenance</h2>
                </center>
                <h2>Introduction</h2>
		<p>The Mark 3 Power Transfer Laser is the latest in the APD line-up of power
		transfer systems, consuming power from a standard NanoTrasen-compatible power
		terminal, and transmitting it by way of a highly-energetic beam of energy.</p>
		<p><b>Caution</b>: Do not stand in the beam-line when the PTL system is
		in operation. Equipment damage, death, or interruption of power transmission
		will occur, and APD Inc. cannot be held liable for damages or resulting loss
		of profits, equipment, or staff.</p>
		<p><b>Caution</b>: The case of the equipment may become hot during operation.</p>
		<h2>Specifications</h2>
		<ul>
		<li><b>Storage Capacity</b>: 5,000,000</li>
		<li><b>Charge Capacity (Max)</b>: 1MW</li>
		<li><b>Transmission Capacity</b>: 1MW</li>
		<li><b>Transmission Efficiency</b>: 80%</li>
		</ul>
		<h2>Operation</h2>
		<p>The Mark 3 Power Transfer Laser is remarkably easy and simple to use, requiring
		only a few simple steps; so easy, even a Staff Assistant could use it!</p>
		<ol>
		<li>Precisely aim the beam-path, during initial installation, to point to your
		desired energy-beam receiver. Careful alignment ensures the best reception,
		and the least wasted power!</li>
		<li>Ensure the path of the beam is free from obstruction before use, to prevent
		property damage or injury.</li>
		<li>Connect the Mk3 PTL to a power feed using a standard NanoTrasen-compatible
		power terminal.</li>
		<li>(Optional) Connect the external heat transfer unit, to permit remote cooling
		during high-power operation. Operation on higher power settings <i>without</i> the
		use of the external heat transfer unit will void your warranty, and may cause damage
		or injury.</li>
		<li>Using the simple, user-friendly interface, enable charging and set the charge
		rate as desired.</li>
		<li>Once the internal storage has reached a safe level, set the desired output
		level and enable transmission.</li>
		<li>Sit back, and watch as the credits roll in from your station's otherwise
		wasted power output! The more power you transmit, the more profitable your
		installation!</li>
		</ol>
		<h2>Assembling the Optional Heat Transfer Unit</h2>
		<center><i>This page is covered with a large oilstain, and is unreadable.</i></center>
		</body>
		</html>"}
