/obj/machinery/vending/donut
	name = "\improper Dunk 'em Donuts"
	desc = "A tasty treat vending machine, brought to you by Donk.co!"
	product_slogans = "The stickiest glaze your ring has ever seen!"
	product_ads = "Thirty thousand calories never tasted so good!;The stickiest glaze your ring has ever seen!"
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

/obj/item/vending_refill/donut
	machine_name = "Dunk 'Em Donuts"
