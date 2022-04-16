/*******************************************************************************
		      Random Seed Packet Spawners
*******************************************************************************/

/obj/random/items/seeds
	name = "random seeds"
	icon = 'icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed"
	alpha = 128
	spread_range = 3

/obj/random/items/seeds/item_to_spawn()
	return pickweight(list(
		/obj/item/seeds/onion = 6,
		/obj/item/seeds/carrot = 6,
		/obj/item/seeds/carrot/parsnip = 3,
		/obj/item/seeds/grape = 4,
		/obj/item/seeds/potato = 5,
		/obj/item/seeds/cabbage = 5,
		/obj/item/seeds/tomato = 4,
		/obj/item/seeds/wheat = 4,
		/obj/item/seeds/corn = 4,
		/obj/item/seeds/banana = 3,
		/obj/item/seeds/apple = 3,
		/obj/item/seeds/lemon = 2,
		/obj/item/seeds/orange = 2,
		/obj/item/seeds/lime = 2,
		/obj/item/seeds/onion/red,
		/obj/item/seeds/chili,
		/obj/item/seeds/cherry,
		/obj/item/seeds/coffee))

/obj/random/items/seeds/few
	name = "a few random seed packets"
	min_amount = 2
	max_amount = 5
