/// Create tile subtypes for a path to simplify mapping.
#define TILECOLORING_SUBTYPE_HELPER(path) \
##path/half {\
	icon_state = "tile_half"; \
} \
##path/half/contrast {\
	icon_state = "tile_half_contrast"; \
} \
##path/anticorner {\
	icon_state = "tile_anticorner"; \
} \
##path/anticorner/contrast {\
	icon_state = "tile_anticorner_contrast"; \
} \
##path/whole {\
	icon_state = "tile_whole"; \
} \
##path/whole/constrast {\
	icon_state = "tile_whole_contrast"; \
} \
##path/diagonal {\
	icon_state = "tile_diagonal"; \
} \

#define SIDING_SUBTYPE_HELPER(path) \
##path/corner {\
	icon_state = "siding_corner"; \
} \
##path/end {\
	icon_state = "siding_end"; \
} \
