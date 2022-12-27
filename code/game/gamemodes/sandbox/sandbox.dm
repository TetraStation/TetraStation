/datum/game_mode/sandbox
	name = "sandbox"
	config_tag = "sandbox"
	report_type = "sandbox"
	required_players = 0

	announce_span = "info"
	announce_text = "Use \"sandbox-panel\" in the BYOND command bar to open the sandbox menu!"

	allow_persistence_save = FALSE

/datum/game_mode/sandbox/pre_setup()
	for(var/mob/M in GLOB.player_list)
		M.CanBuild()
	return 1

/datum/game_mode/sandbox/post_setup()
	..()
	SSshuttle.registerHostileEnvironment(src)
	addtimer(CALLBACK(src, .proc/shareware_mode_end), 30 MINUTES) // End the round after 30 minutes, for demo mode:tm: shareware style. Other gamemodes aren't affected.

/datum/game_mode/sandbox/generate_report()
	return "Sensors indicate that crewmembers have been all given psychic powers from which they can manifest various objects.<br><br>This can only end poorly."

/datum/game_mode/sandbox/proc/shareware_mode_end()
		priority_announce("Sandbox rounds automatically end 30 minutes into the round - But don't fret, more's to come soon! Help develop more of the game on our github, or simply talk about the game on the discord. Non-Sandbox, Real rounds will come... eventually.", "Thank you for testing TetraStation on Sandbox Mode!", 'sound/ai/Tetra/Sandbox.ogg')
		SSticker.force_ending = 1
