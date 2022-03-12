/*******************************************************************************
		  Random Atmospherics Items Spawners
*******************************************************************************/

/obj/random/equipment/atmospherics/canister
	name = "random canister"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "random_canister"
	alpha = 128

/obj/random/equipment/atmospherics/canister/item_to_spawn()
	return pickweight(list(/obj/machinery/portable_atmospherics/canister/air = 8,
		/obj/machinery/portable_atmospherics/canister/oxygen = 8,
		/obj/machinery/portable_atmospherics/canister/nitrogen = 6,
		/obj/machinery/portable_atmospherics/canister/water_vapor = 4,
		/obj/machinery/portable_atmospherics/canister/freon = 2,
		/obj/machinery/portable_atmospherics/canister/carbon_dioxide = 1,
		/obj/machinery/portable_atmospherics/canister/nob = 1,
		/obj/machinery/portable_atmospherics/canister/stimulum = 1,
		/obj/machinery/portable_atmospherics/canister/hydrogen = 1
		))

/obj/random/equipment/atmospherics/canister/low_chance
	name = "low chance random canister"
	spawn_nothing_percentage = 60

/obj/random/equipment/atmospherics/canister/dangerous
	name = "random dangerous canister"

/obj/random/equipment/atmospherics/canister/dangerous/item_to_spawn()
	return pickweight(list(
		/obj/machinery/portable_atmospherics/canister/carbon_dioxide = 7,
		/obj/machinery/portable_atmospherics/canister/toxins = 6,
		/obj/machinery/portable_atmospherics/canister/nitrous_oxide = 4,
		/obj/machinery/portable_atmospherics/canister/bz = 3,
		/obj/machinery/portable_atmospherics/canister/tritium = 1,
		/obj/machinery/portable_atmospherics/canister/miasma = 3,
		/obj/machinery/portable_atmospherics/canister/hydrogen = 3,
		/obj/machinery/portable_atmospherics/canister/nitryl = 3
		))
