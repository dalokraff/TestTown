return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`TestTown` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("TestTown", {
			mod_script       = "scripts/mods/TestTown/TestTown",
			mod_data         = "scripts/mods/TestTown/TestTown_data",
			mod_localization = "scripts/mods/TestTown/TestTown_localization",
		})
	end,
	packages = {
		"resource_packages/TestTown/TestTown",
	},
}
