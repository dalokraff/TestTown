local mod = get_mod("TestTown")
local level_name = mod.level_name
local level_package_name = mod.level_package_name
local path_to_level = mod.path_to_level
-- local path_to_level = "content/levels/test_level"

LevelSettings[level_name] = {
	conflict_settings = "skaven",
	no_terror_events = true,
	package_name = level_package_name,
    packages = {
		"resource_packages/levels/inn_dependencies",
		"resource_packages/levels/inn",
        "resource_packages/levels/dlcs/holly/magnus",
        -- "resource_packages/levels/dlcs/morris/tzeentch_common",
        "resource_packages/levels/honduras/bell_common",
		"resource_packages/levels/honduras/bell",
        -- "resource_packages/levels/honduras/military_common",
        -- "resource_packages/levels/honduras/bell_common",
        -- "resource_packages/levels/honduras/ussingen_common",
		-- "resource_packages/levels/honduras/military",
		-- "resource_packages/levels/honduras/military_meta"
	},
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	ambient_sound_event = "silent_default_world_sound",
	level_name = path_to_level,
    -- level_name = "levels/inn/event_decoration/halloween/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	display_name = level_name,
    description_text = 'custom_level_test',
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
    mechanism = "adventure",

    level_id = level_name,
    act = 'act_testing',

    boss_spawning_method = "hand_placed",

    pickup_settings = {
		{
			primary = {
				ammo = 6,
				painting_scrap = 3,
				potions = 4,
				grenades = 4,
				healing = {
					first_aid_kit = 3,
					healing_draught = 5
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 5,
				grenades = 5,
				healing = 5,
				potions = 5
			}
		},
		normal = {
			primary = {
				ammo = 6,
				painting_scrap = 3,
				potions = 6,
				grenades = 6,
				healing = {
					first_aid_kit = 6,
					healing_draught = 8
				},
				level_events = {
					explosive_barrel = 3,
					lamp_oil = 3
				}
			},
			secondary = {
				ammo = 8,
				grenades = 10,
				healing = 12,
				potions = 10
			}
		}
	},
}

TerrorEventBlueprints[level_name] = {}

LevelSettings['gotwf'] = {
	conflict_settings = "level_editor",
	no_terror_events = true,
	package_name = 'resource_packages/dlcs/gotwf_store_resources',
    packages = {
        "resource_packages/TestTown/TestTown",
		"resource_packages/levels/inn_dependencies",
        'resource_packages/dlcs/gotwf_store_resources',
	},
	player_aux_bus_name = "environment_reverb_outside",
	environment_state = "exterior",
	knocked_down_setting = "knocked_down",
	ambient_sound_event = "silent_default_world_sound",
	level_name = 'levels/gifts_of_the_wolf_father/gifts_of_wolf_father',
    -- level_name = "levels/inn/event_decoration/halloween/world",
	level_image = "level_image_any",
	loading_ui_package_name = "loading_screen_1",
	display_name = level_name,
	source_aux_bus_name = "environment_reverb_outside_source",
	level_particle_effects = {},
	level_screen_effects = {},
	locations = {},
    mechanism = "adventure",

    boss_spawning_method = "hand_placed",
}

local key_num = #NetworkLookup.level_keys + 1
NetworkLookup.level_keys[key_num] = 'gotwf'
NetworkLookup.level_keys['gotwf'] = key_num

mod.level_id = mod.level_id or #NetworkLookup.level_keys + 1
NetworkLookup.level_keys[mod.level_id] = level_name
NetworkLookup.level_keys[level_name] = mod.level_id

local act_id = #NetworkLookup.act_keys + 1
NetworkLookup.act_keys[act_id] = 'act_testing'
NetworkLookup.act_keys['act_testing'] = act_id

local mission_id = #NetworkLookup.mission_ids + 1
NetworkLookup.mission_ids[mission_id] = level_name
NetworkLookup.mission_ids[level_name] = mission_id
