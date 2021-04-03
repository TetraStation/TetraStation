/obj/machinery/computer/mechbay
	name = "mechbay console"
	desc = "Used to receive work orders, and control the shuttle."
	icon_screen = "mechbay"
	circuit = /obj/item/circuitboard/computer/mechbay
	light_color = COLOR_VIOLET

	var/printer_ready

	/// Radio used to send messages on science channel
	var/obj/item/radio/headset/radio

/obj/machinery/computer/mechbay/Initialize()
	. = ..()
	radio = new /obj/item/radio/headset/headset_sci(src)
	printer_ready = world.time + PRINTER_TIMEOUT

/obj/machinery/computer/mechbay/Destroy()
	QDEL_NULL(radio)
	..()

/obj/machinery/computer/mechbay/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Mechbay", name)
		ui.open()

/obj/machinery/computer/mechbay/ui_data()
//	var/list/data = list()

//	data["location"] = SSshuttle.dropship.getStatusText()

//	var/datum/bank_account/D = SSeconomy.get_dep_account(ACCOUNT_SCI)
//	if(D)
//		data["points"] = D.account_balance

//	data["away"] = SSshuttle.dropship.getDockedId() == "dropship_away"
//	data["docked"] = SSshuttle.dropship.mode == SHUTTLE_IDLE

/obj/machinery/computer/mechbay/ui_act(action, params, datum/tgui/ui)
	if(..())
		return

/obj/machinery/computer/mechbay/proc/print_paper(type, thing, amount, payment)
	var/obj/item/paper/work_order/W = new(loc)
	if(W)
		W.info = "<h2>NanoTrasen Work Order</h2></br>"
		switch(type)
			if("repair")
				W.info += "<h3>Repair</h3></br><strong>Complete repair of:</br>"
			if("manuf")
				W.info += "<h3>Manufacture</h3></br><strong>Manufacture and supply of:</br>"
		W.info += "<ul><li><em>[amount]</em> [thing]</li></ul></br>"
		W.info = "<em>Payment of [payment] upon receipt of goods and stamped work order via return shuttle..</em>"

/obj/item/paper/work_order
	name = "paper - Mechbay work order"

/obj/item/paper/work_order/Initialize()
	. = ..()
	update_icon()
