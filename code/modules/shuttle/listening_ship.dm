/obj/machinery/computer/shuttle/listening_ship
	name = "Syndicate Recon Vessel Helm Console"
	desc = "Used to control the Syndicate listening ship."
	shuttleId = "commsagent"
	possible_destinations = "commsagent_home;whiteship_z4;commsagent_custom"
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
	req_access = list(ACCESS_SYNDICATE)


/obj/machinery/computer/camera_advanced/shuttle_docker/listening_ship
	name = "Syndicate Recon Vessel Navigation Console"
	desc = "Used to designate a precise transit location for the Syndicate listening ship."
	shuttleId = "commsagent"
	lock_override = NONE
	shuttlePortId = "commsagent_custom"
	jumpto_ports = list("commsagent_home" = 1, "whiteship_z4" = 1)
	view_range = 10
	x_offset = -6
	y_offset = -10
	designate_time = 10
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = COLOR_SOFT_RED
