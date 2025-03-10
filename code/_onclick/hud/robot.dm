/atom/movable/screen/robot
	icon = 'icons/mob/screen_cyborg.dmi'

/atom/movable/screen/robot/module
	name = "cyborg module"
	icon_state = "nomod"

/atom/movable/screen/robot/Click()
	if(isobserver(usr))
		return 1

/atom/movable/screen/robot/module/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	if(R.module.type != /obj/item/robot_module)
		R.hud_used.toggle_show_robot_modules()
		return 1
	R.pick_module()

/atom/movable/screen/robot/module1
	name = "module1"
	icon_state = "inv1"

/atom/movable/screen/robot/module1/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.toggle_module(1)

/atom/movable/screen/robot/module2
	name = "module2"
	icon_state = "inv2"

/atom/movable/screen/robot/module2/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.toggle_module(2)

/atom/movable/screen/robot/module3
	name = "module3"
	icon_state = "inv3"

/atom/movable/screen/robot/module3/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.toggle_module(3)

/atom/movable/screen/robot/radio
	name = "radio"
	icon_state = "radio"

/atom/movable/screen/robot/radio/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.radio.interact(R)

/atom/movable/screen/robot/store
	name = "store"
	icon_state = "store"

/atom/movable/screen/robot/store/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.uneq_active()

/atom/movable/screen/robot/lamp
	name = "headlamp"
	icon_state = "lamp0"

/atom/movable/screen/robot/lamp/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.control_headlamp()

/atom/movable/screen/robot/thrusters
	name = "ion thrusters"
	icon_state = "ionpulse0"

/atom/movable/screen/robot/thrusters/Click()
	if(..())
		return
	var/mob/living/silicon/robot/R = usr
	R.toggle_ionpulse()

/datum/hud/robot
	ui_style = 'icons/mob/screen_cyborg.dmi'

/datum/hud/robot/New(mob/owner)
	..()
	var/mob/living/silicon/robot/mymobR = mymob
	var/atom/movable/screen/using

	using = new/atom/movable/screen/language_menu
	using.screen_loc = ui_borg_language_menu
	static_inventory += using

//Radio
	using = new /atom/movable/screen/robot/radio()
	using.screen_loc = ui_borg_radio
	using.hud = src
	static_inventory += using

//Module select
	using = new /atom/movable/screen/robot/module1()
	using.screen_loc = ui_inv1
	using.hud = src
	static_inventory += using
	mymobR.inv1 = using

	using = new /atom/movable/screen/robot/module2()
	using.screen_loc = ui_inv2
	using.hud = src
	static_inventory += using
	mymobR.inv2 = using

	using = new /atom/movable/screen/robot/module3()
	using.screen_loc = ui_inv3
	using.hud = src
	static_inventory += using
	mymobR.inv3 = using

//End of module select

//Photography stuff
	using = new /atom/movable/screen/ai/image_take()
	using.screen_loc = ui_borg_camera
	using.hud = src
	static_inventory += using

	using = new /atom/movable/screen/ai/image_view()
	using.screen_loc = ui_borg_album
	using.hud = src
	static_inventory += using

//Sec/Med HUDs
	using = new /atom/movable/screen/ai/sensors()
	using.screen_loc = ui_borg_sensor
	using.hud = src
	static_inventory += using

//Headlamp control
	using = new /atom/movable/screen/robot/lamp()
	using.screen_loc = ui_borg_lamp
	using.hud = src
	static_inventory += using
	mymobR.lamp_button = using

//Thrusters
	using = new /atom/movable/screen/robot/thrusters()
	using.screen_loc = ui_borg_thrusters
	using.hud = src
	static_inventory += using
	mymobR.thruster_button = using

//Intent
	action_intent = new /atom/movable/screen/act_intent/robot()
	action_intent.icon_state = mymob.a_intent
	action_intent.hud = src
	static_inventory += action_intent

//Health
	healths = new /atom/movable/screen/healths/robot()
	healths.hud = src
	infodisplay += healths

//Installed Module
	mymobR.hands = new /atom/movable/screen/robot/module()
	mymobR.hands.screen_loc = ui_borg_module
	mymobR.hands.hud = src
	static_inventory += mymobR.hands

//Store
	module_store_icon = new /atom/movable/screen/robot/store()
	module_store_icon.screen_loc = ui_borg_store
	module_store_icon.hud = src

	pull_icon = new /atom/movable/screen/pull()
	pull_icon.icon = 'icons/mob/screen_cyborg.dmi'
	pull_icon.screen_loc = ui_borg_pull
	pull_icon.hud = src
	pull_icon.update_icon()
	hotkeybuttons += pull_icon


	zone_select = new /atom/movable/screen/zone_sel/robot()
	zone_select.hud = src
	zone_select.update_icon()
	static_inventory += zone_select


/datum/hud/proc/toggle_show_robot_modules()
	if(!iscyborg(mymob))
		return

	var/mob/living/silicon/robot/R = mymob

	R.shown_robot_modules = !R.shown_robot_modules
	update_robot_modules_display()

/datum/hud/proc/update_robot_modules_display(mob/viewer)
	if(!iscyborg(mymob))
		return

	var/mob/living/silicon/robot/R = mymob

	var/mob/screenmob = viewer || R

	if(!R.module)
		return

	if(!R.client)
		return

	if(R.shown_robot_modules && screenmob.hud_used.hud_shown)
		//Modules display is shown
		screenmob.client.screen += module_store_icon	//"store" icon

		if(!R.module.modules)
			to_chat(usr, "<span class='warning'>Selected module has no modules to select!</span>")
			return

		if(!R.robot_modules_background)
			return

		var/display_rows = CEILING(length(R.module.get_inactive_modules()) / 8, 1)
		R.robot_modules_background.screen_loc = "CENTER-4:16,SOUTH+1:7 to CENTER+3:16,SOUTH+[display_rows]:7"
		screenmob.client.screen += R.robot_modules_background

		var/x = -4	//Start at CENTER-4,SOUTH+1
		var/y = 1

		for(var/atom/movable/A in R.module.get_inactive_modules())
			//Module is not currently active
			screenmob.client.screen += A
			if(x < 0)
				A.screen_loc = "CENTER[x]:16,SOUTH+[y]:7"
			else
				A.screen_loc = "CENTER+[x]:16,SOUTH+[y]:7"
			A.plane = ABOVE_HUD_PLANE

			x++
			if(x == 4)
				x = -4
				y++

	else
		//Modules display is hidden
		screenmob.client.screen -= module_store_icon	//"store" icon

		for(var/atom/A in R.module.get_inactive_modules())
			//Module is not currently active
			screenmob.client.screen -= A
		R.shown_robot_modules = 0
		screenmob.client.screen -= R.robot_modules_background

/datum/hud/robot/persistent_inventory_update(mob/viewer)
	if(!mymob)
		return
	var/mob/living/silicon/robot/R = mymob

	var/mob/screenmob = viewer || R

	if(screenmob.hud_used)
		if(screenmob.hud_used.hud_shown)
			for(var/i in 1 to R.held_items.len)
				var/obj/item/I = R.held_items[i]
				if(I)
					switch(i)
						if(1)
							I.screen_loc = ui_inv1
						if(2)
							I.screen_loc = ui_inv2
						if(3)
							I.screen_loc = ui_inv3
						else
							return
					screenmob.client.screen += I
		else
			for(var/obj/item/I in R.held_items)
				screenmob.client.screen -= I
