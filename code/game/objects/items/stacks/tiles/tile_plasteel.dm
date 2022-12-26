//Plasteel (normal)
/obj/item/stack/tile/plasteel
	name = "floor tile"
	singular_name = "floor tile"
	desc = "The ground you walk on."
	icon_state = "tile"
	inhand_icon_state = "tile"
	force = 6
	custom_materials = list(/datum/material/iron=500)
	throwforce = 10
	flags_1 = CONDUCT_1
	turf_type = /turf/open/floor/plasteel
	mineralType = "metal"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 70)
	resistance_flags = FIRE_PROOF
	matter_amount = 1
	merge_type = /obj/item/stack/tile/plasteel

/obj/item/stack/tile/plasteel/cyborg
	custom_materials = null // All other Borg versions of items have no Metal or Glass - RR
	is_cyborg = 1
	cost = 125
