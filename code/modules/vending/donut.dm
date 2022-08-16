/obj/machinery/vending/donut
	name = "\improper Dunk 'em Donuts"
	desc = "A tasty treat vending machine, brought to you by Donk.co!"
	product_slogans = "The stickiest glaze your ring has ever seen!"
	product_ads = "Thirty thousand calories never tasted so good!;The stickiest glaze your ring has ever seen!;get that nut u crave"
	icon_state = "donut"
	light_mask = "donut-light-mask"
	products = list(/obj/item/reagent_containers/food/snacks/donut/plain = 6,
			/obj/item/reagent_containers/food/snacks/donut/berry = 6,
			/obj/item/reagent_containers/food/snacks/donut/apple = 6,
			/obj/item/reagent_containers/food/snacks/donut/caramel = 6,
			/obj/item/reagent_containers/food/snacks/donut/choco = 6,
			/obj/item/reagent_containers/food/snacks/donut/jelly = 6,
			/obj/item/reagent_containers/food/snacks/donut/jelly/berry = 3,
			/obj/item/reagent_containers/food/snacks/donut/jelly/apple = 3,
			/obj/item/reagent_containers/food/snacks/donut/jelly/caramel = 3,
			/obj/item/reagent_containers/food/snacks/donut/jelly/choco = 3)
	contraband = list(/obj/item/reagent_containers/food/snacks/donut/chaos = 3)
	refill_canister = /obj/item/vending_refill/donut
	canload_access_list = list(ACCESS_KITCHEN)
	default_price = 60
	extra_price = 160
	payment_department = ACCOUNT_SRV
	input_display_header = "Chef's Food Selection"
	var/dado = FALSE

/obj/item/vending_refill/donut
	machine_name = "Dunk 'Em Donuts"


/obj/machinery/vending/donut/ui_act(action, params)
	switch(action)
		if("vend")
			. = TRUE
			if(!vend_ready)
				return
			if(panel_open)
				to_chat(usr, "<span class='warning'>The vending machine cannot dispense products while its service panel is open!</span>")
				return
			vend_ready = FALSE //One thing at a time!!
			var/datum/data/vending_product/R = locate(params["ref"])
			var/list/record_to_check = product_records + coin_records
			var/mob/living/carbon/human/H
			var/obj/item/card/id/C
			if(onstation && ishuman(usr))
				H = usr
				C = H.get_idcard(TRUE)

			switch(H?.job)
				if("Security Officer")
					dado = TRUE
				if("Warden")
					dado = TRUE
				if("Head of Security")
					dado = TRUE


			if(extended_inventory)
				record_to_check = product_records + coin_records + hidden_records
			if(!R || !istype(R) || !R.product_path)
				vend_ready = TRUE
				return
			var/price_to_use = default_price
			if(R.custom_price)
				price_to_use = R.custom_price
			if(R in hidden_records)
				if(!extended_inventory)
					vend_ready = TRUE
					return
			else if (!(R in record_to_check))
				vend_ready = TRUE
				message_admins("Vending machine exploit attempted by [ADMIN_LOOKUPFLW(usr)]!")
				return
			if (R.amount <= 0)
				say("Sold out of [R.name].")
				flick(icon_deny,src)
				vend_ready = TRUE
				return

			if(!C)
				say("No card found.")
				flick(icon_deny,src)
				vend_ready = TRUE
				return
			else if (!C.registered_account)
				say("No account found.")
				flick(icon_deny,src)
				vend_ready = TRUE
				return
			else if(age_restrictions && R.age_restricted && (!C.registered_age || C.registered_age < AGE_MINOR))
				say("You are not of legal age to purchase [R.name].")
				if(!(usr in GLOB.narcd_underages))
					Radio.set_frequency(FREQ_SECURITY)
					Radio.talk_into(src, "SECURITY ALERT: Underaged crewmember [H] recorded attempting to purchase [R.name] in [get_area(src)]. Please watch for substance abuse.", FREQ_SECURITY)
					GLOB.narcd_underages += H
				flick(icon_deny,src)
				vend_ready = TRUE
				return
			var/datum/bank_account/account = C.registered_account
			if(account.account_job && account.account_job.paycheck_department == payment_department)
				price_to_use = 0
			if(coin_records.Find(R) || hidden_records.Find(R))
				price_to_use = R.custom_premium_price ? R.custom_premium_price : extra_price
			if(price_to_use && !account.adjust_money(-price_to_use))
				say("You do not possess the funds to purchase [R.name].")
				flick(icon_deny,src)
				vend_ready = TRUE
				return
			var/datum/bank_account/D = SSeconomy.get_dep_account(payment_department)
			if(D)
				D.adjust_money(price_to_use)
				SSblackbox.record_feedback("amount", "vending_spent", price_to_use)
				log_econ("[price_to_use] credits were inserted into [src] by [D.account_holder] to buy [R].")
			if(last_shopper != usr || purchase_message_cooldown < world.time)
				say("Thank you for shopping with [src]!")
				purchase_message_cooldown = world.time + 5 SECONDS
				last_shopper = usr
			use_power(5)
			if(icon_vend) //Show the vending animation if needed
				flick(icon_vend,src)
			playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
			var/obj/item/reagent_containers/food/snacks/donut/daNut = new R.product_path(get_turf(src))
			if(dado)
				daNut.reagents.add_reagent(/datum/reagent/toxin/fentanyl, 3)
				H.ForceContractDisease(new /datum/disease/porkoliosis)

			R.amount--
			SSblackbox.record_feedback("nested tally", "vending_machine_usage", 1, list("[type]", "[R.product_path]"))
			vend_ready = TRUE
		else
			. = ..()
