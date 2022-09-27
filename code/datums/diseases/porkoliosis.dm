/datum/disease/porkoliosis
	name = "Porkoliosis"
	max_stages = 4
	spread_text = "Paranormal"
	spread_flags = DISEASE_SPREAD_SPECIAL
	cure_text = "Man up and tough it out!"
	agent = "Class Traitor"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "The subject appears to be bloating, their colon apparently harboring... a live pig?!"
	severity = DISEASE_SEVERITY_HARMFUL
	bypasses_immunity = TRUE
	process_dead = FALSE
	stage_prob = 1
	infectivity = 0

/datum/disease/porkoliosis/stage_act()
	. = ..()
	if(!.)
		return

	switch(stage)
		if(1)
			if(prob(2))
				affected_mob.emote("burp")
			if(affected_mob?.reagents.has_reagent(/datum/reagent/toxin/fentanyl) && prob(1))
				affected_mob.emote(pick("faint", "twitch"))
		if(2)
			if(affected_mob?.reagents.has_reagent(/datum/reagent/toxin/fentanyl) && prob(2))
				affected_mob.emote(pick("faint", "twitch"))
			if(prob(4))
				affected_mob.emote("groan")
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>You feel bloated.</span>")
				affected_mob.emote("burp")
			if(prob(1))
				to_chat(affected_mob, "<span class='danger'>Your stomach hurts!</span>")
				affected_mob.emote("groan")
				if(prob(25))
					affected_mob.emote("fart")
					affected_mob.adjustBruteLoss(1, FALSE)
		if(3)
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>Your guts REALLY hurt!</span>")
				affected_mob.emote("fart")
				if(prob(25))
					affected_mob.emote("scream")
					affected_mob.adjustBruteLoss(3)
			if(prob(5))
				affected_mob.emote("groan")
			if(affected_mob?.reagents.has_reagent(/datum/reagent/toxin/fentanyl) && prob(5))
				affected_mob.emote(pick("twitch", "faint"))

		if(4)
			if(prob(5))
				to_chat(affected_mob, "<span class='danger'>The pain is excruciating!</span>")
				affected_mob.emote("scream")
				affected_mob.adjustBruteLoss(5)
			if(prob(3))
				to_chat(affected_mob, "<span class='danger'>Your guts can take no more! Something wriggles inside you...</span>")
				if(prob(25))
					affected_mob.emote("scream")
					affected_mob.emote("fart")
					affected_mob.adjustBruteLoss(15)
					affected_mob.add_splatter_floor(get_turf(src))
					new /mob/living/simple_animal/pig(get_turf(affected_mob)) // Some pig!
					to_chat(affected_mob, "<span class='notice'>Finally, your torment is over... You wonder if this job is worth this sort of pigshit...</span>")
					remove_disease()
			if(affected_mob?.reagents.has_reagent(/datum/reagent/toxin/fentanyl) && prob(5))
				affected_mob.emote(pick("scream","twitch","faint"))
