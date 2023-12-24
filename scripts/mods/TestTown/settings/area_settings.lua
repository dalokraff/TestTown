local mod = get_mod("TestTown")
AreaSettings.VersuchenStadt = {
    menu_sound_event = "Play_hud_menu_area_helmgart",
	name = mod.level_name,
	display_name = "area_selection_helmgart_name",
	description_text = "area_selection_helmgart_description",
	level_image = "area_icon_helmgart",
	sort_order = 2,
	video_settings = {
		material_name = "area_video_helmgart",
		resource = "video/area_videos/helmgart/area_video_helmgart"
	},
	acts = {
		"act_testing",
	}
}

GameActs.act_testing = {
    mod.level_name
}

-- UnlockableLevels[#UnlockableLevels + 1] = 'VersuchenStadt'


ActSettings.act_testing = {
	display_name = "area_selection_onions_name",
	console_offset = 0,
	draw_path = false,
	sorting = 2,
	banner_texture = "menu_frame_bg_01"
}

-- preventing backend stat lookup crashing
-- LevelDifficultyDBNames[mod.level_name] = mod.level_name..'_difficulty_completed'

-- for k,v in pairs(LevelDifficultyDBNames) do
--     print(k,v)
-- end

-- local spawn_zones = mod:dofile('levels/honduras/bell/world_spawn_zones')

-- mod:echo(#Managers.state.conflict.spawn_zone_baker.spawn_pos_lookup)