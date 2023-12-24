local WwiseVisualization = require 'core/wwise/lua/wwise_visualization'

WwiseFlowCallbacks = WwiseFlowCallbacks or {}

local M = WwiseFlowCallbacks

function M.wwise_load_bank(t)

end

function M.wwise_unit_load_bank(t)

end

function M.wwise_unload_bank(t)

end

function M.wwise_set_language(t)

end

function M.wwise_set_listener_pose(t)

end

function M.wwise_move_listener_to_unit(t)

end

function M.wwise_trigger_event(t)
	return {playing_id = -1, source_id = -1, Playing_Id = -1, Source_Id = -1}
end

local function make_source(t, wwise_world_function)

end

function M.wwise_make_auto_source(t)

end

function M.wwise_make_manual_source(t)

end

function M.wwise_destroy_manual_source(t)

end

function M.wwise_stop_event(t)

end

function M.wwise_pause_event(t)

end

function M.wwise_resume_event(t)

end

function M.wwise_set_source_position(t)

end

function M.wwise_set_source_parameter(t)

end

function M.wwise_set_global_parameter(t)

end

function M.wwise_set_state(t)

end

function M.wwise_set_switch(t)

end

function M.wwise_post_trigger(t)

end

function M.wwise_has_source(t)

end

function M.wwise_is_playing(t)

end

function M.wwise_get_playing_elapsed(t)

end

function M.wwise_add_soundscape_source(t)
	return {ss_source_id = -1, SS_Source_Id = -1}
end

function M.wwise_remove_soundscape_source(t)

end

function M.wwise_set_obstruction_and_occlusion_for_soundscape_source(t)

end

function M.wwise_add_soundscape_render_unit(t)
	local unit = t.Unit or t.unit
	if unit then
		WwiseVisualization.add_soundscape_unit(unit)
	end
end

function M.wwise_set_environment(t)

end

function M.wwise_set_dry_environment(t)

end

function M.wwise_reset_environment(t)

end

function M.wwise_set_source_environment(t)

end

function M.wwise_set_source_dry_environment(t)

end

function M.wwise_reset_source_environment(t)

end

function M.wwise_set_obstruction_and_occlusion(t)

end

function M.dialogue_silence_unit(t)

end
