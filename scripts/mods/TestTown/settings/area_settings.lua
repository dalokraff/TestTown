local mod = get_mod("TestTown")
AreaSettings.VersuchenStadt = {
    menu_sound_event = "Play_hud_menu_area_helmgart",
	name = mod.level_name,
	display_name = "custom_levels",
	description_text = "custom_level_desc",
	level_image = "level_image_any",
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