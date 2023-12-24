local mod = get_mod("TestTown")

local SpawnDefinitionsFuncs = mod:dofile("scripts/mods/TestTown/vanill_unit_spawning/spawn_def_funcs")

local function radians_to_quaternion(theta, ro, phi)
    local c1 =  math.cos(theta/2)
    local c2 = math.cos(ro/2)
    local c3 = math.cos(phi/2)
    local s1 = math.sin(theta/2)
    local s2 = math.sin(ro/2)
    local s3 = math.sin(phi/2)
    local x = (s1*s2*c3) + (c1*c2*s3)
    local y = (s1*c2*c3) + (c1*s2*s3)
    local z = (c1*s2*c3) - (s1*c2*s3)
    local w = (c1*c2*c3) - (s1*s2*s3)
    local rot = Quaternion.from_elements(x, y, z, w)
    return rot
end

--============================================================================
--============================================================================
-- hooks for bypassing package manager since mod package should already be loaded
--============================================================================
--============================================================================
mod:hook(PackageManager, "load", function(func, self, package_name, reference_name, callback, asynchronous, prioritize)
	if package_name == mod.level_package_name then
		-- Load the keep in sync with out package because we use it's shading environment
		-- Managers.package:load("resource_packages/levels/inn", "TestLevel", nil, true)
		return mod:load_package(package_name)
	else
		return func(self, package_name, reference_name, callback, asynchronous, prioritize)
	end
end)

mod:hook(PackageManager, "has_loaded", function(func, self, package_name, reference_name)
	if package_name == mod.level_package_name then
		-- Load the keep in sync with out package because we use it's shading environment
		-- local inn_loaded = Managers.package:has_loaded("resource_packages/levels/inn", "TestLevel")
		return mod:package_status(package_name) == "loaded"
	else
		return func(self, package_name, reference_name)
	end
end)

mod:hook(PackageManager, "unload", function(func, self, package_name, reference_name)
	if package_name == mod.level_package_name then
		-- Unload the keep in sync with out package because we use it's shading environment
		-- Managers.package:unload("resource_packages/levels/inn", "TestLevel")
		return mod:unload_package(package_name)
	else
		return func(self, package_name, reference_name)
	end
end)

--replaces item skin name and descritpion
mod:hook(LocalizationManager, "_base_lookup", function (func, self, text_id)

    if not string.find(mod:localize(text_id), "<") then
        return mod:localize(text_id)
    end

	return func(self, text_id)
end)


--============================================================================
--============================================================================
-- origin hook to prevent crashing when select custom area, to view cusotm missions
-- simply adding an entry to the UnlockableLevels will result in having to placing more hooks and
-- more table editing due to interferance with the backend stats funcitons
--============================================================================
--============================================================================
local UnlockableLevels = UnlockableLevels or {}

local overwrite_UnlockableLevels = table.create_copy({}, UnlockableLevels)
overwrite_UnlockableLevels[#overwrite_UnlockableLevels + 1] = 'VersuchenStadt'

local function sort_levels_by_order(a, b)
	local a_presentation_order = a.act_presentation_order
	local b_presentation_order = b.act_presentation_order

	return a_presentation_order < b_presentation_order
end

mod:hook(StartGameWindowMissionSelection,'_setup_level_acts', function (func, self)
	local levels_by_act = {}
	local num_levels_added = 0

	for _, level_key in pairs(overwrite_UnlockableLevels) do
		if not table.find(NoneActLevels, level_key) then
			local level_settings = LevelSettings[level_key]
			local act = level_settings.act

			if not levels_by_act[act] then
				levels_by_act[act] = {}
			end

			local act_levels = levels_by_act[act]
			local index = #act_levels + 1
			act_levels[index] = level_settings
			num_levels_added = num_levels_added + 1
		end
	end

	for _, levels in pairs(levels_by_act) do
		table.sort(levels, sort_levels_by_order)
	end

	self._levels_by_act = levels_by_act
    return
end)

mod:hook(StartGameWindowMissionSelectionConsole,'_setup_level_acts', function (func, self, acts)
	local levels_by_act = {}
	local num_levels_added = 0

	for _, level_key in pairs(overwrite_UnlockableLevels) do
		if not table.find(NoneActLevels, level_key) then
			local level_settings = LevelSettings[level_key]
			local act = level_settings.act

			if table.find(acts, act) then
				if not levels_by_act[act] then
					levels_by_act[act] = {}
				end

				local act_levels = levels_by_act[act]
				local index = #act_levels + 1
				act_levels[index] = level_settings
				num_levels_added = num_levels_added + 1
			end
		end
	end

	for _, levels in pairs(levels_by_act) do
		table.sort(levels, sort_levels_by_order)
	end

	self._levels_by_act = levels_by_act
    return
end)



mod:hook(StatisticsDatabase, 'get_persistent_stat', function (func, self, id, ...)
    local args = {...}
    for k,v in pairs(args) do
        if v == mod.level_name then
            return 1
        end
    end
    return func(self, id, ...)
end)
--============================================================================
--============================================================================
-- hooks to prevet crashes/substitute assets for other assets
--============================================================================
--============================================================================
mod:hook(Level, "get_data", function(func, level, key)
	local result = func(level, key)
    print('Shading enviroment '..tostring(result))
	if key == "shading_environment" and result == nil then
		-- Use the keeps shading environment because we don't have our own yet
		-- return "environment/honduras_keep_02"
        return "environment/bulldozer_magnus_01"
	end
	return result
end)

mod:hook(AdventureSpawning, "get_spawn_point", function(func, self)
	local game_mode = Managers.state.game_mode
	local default_state = "default"
	local prior_state = Managers.mechanism:get_prior_state() or default_state
	local spawn_points = self._spawn_points[prior_state] or self._spawn_points[default_state]

	if spawn_points == nil then
		local world = Managers.world:world("level_world")
		local spawners = World.units_by_resource(world, "sdk_imports/cubemap_probe")
        -- local spawners = World.units_by_resource(world, "content/models/props/spawner")

		for _, unit in ipairs(spawners) do
			if game_mode then
				game_mode:flow_callback_add_spawn_point(unit)
			end
		end

        if #spawners == 0 then
            local unit = World.spawn_unit(world, "sdk_imports/cubemap_probe", Vector3(-42.1067, 255.94, 52.0733))
            if game_mode then
				game_mode:flow_callback_add_spawn_point(unit)
			end
        end
	end


	return func(self)
end)


mod:hook(ConflictDirector,'init', function(func, self, world, ...)
    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        SpawnDefinitionsFuncs.spawn_testing_mesh(Vector3(0,0,60), world)
    end

    local result = func(self, world, ...)


    return result
end)

--boss gizmoz need to be spawned after conflict director is assigned to use lua to add their extension
mod:hook(NetworkedFlowStateManager, 'init', function(func, self, world, ...)
    local result = func(self, world, ...)
    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        SpawnDefinitionsFuncs.spawn_dependant_units(Vector3(0,0,60), world)
    end

    return result
end)

mod:hook(_G, 'flow_callback_boss_gizmo_spawned', function(func, params)
    mod:echo('flow_callback_boss_gizmo_spawned')
    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        local has_trave_dist = Unit.get_data(unit, 'travel_dist')
        if not has_trave_dist then
            return
        end
    end


    local result = func(params)

    return results
end)

--pickup gizmos need the Managers.state.entity assigned
mod:hook(BotNavTransitionManager,'init', function (func, self, world, ...)
    local results = func(self, world, ...)
    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        SpawnDefinitionsFuncs.spawn_pickup_units(Vector3(0,0,60), world)
    end

    return results
end)

-- respawn units need to have some properties set before being added to the level
mod:hook(_G, 'flow_callback_respawn_unit_spawned', function(func, params)

    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        local distance_through_level = Unit.get_data(unit, 'distance_through_level')
        if not distance_through_level then
            return
        end
    end

    local results = func(params)

    return results
end)


-- the level unit/index methods are used to send unit ids across clients thorugh rps, need a better way to handle this
mod:hook(Level, 'unit_index', function(func, current_level, unit)
    local index = func(current_level, unit)

    if index == nil then
        if Unit.has_data(unit, 'respawn_id') then
            return Unit.get_data(unit, 'respawn_id')
        end
    end

    return index
end)


mod:hook(Level, 'unit_by_index', function(func, self, index)
    local unit = func(self, index)

    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        local new_unit = mod.respawn_units[index]
        if (unit == nil) or (not Unit.has_data(unit, 'respawn_id')) then
            if Unit.alive(new_unit) then
                return new_unit
            end
        end
    end


    return unit
end)

--============================================================================
--============================================================================
-- activates waystone for custom level
--============================================================================
--============================================================================
mod:hook(EndZoneExtension, '_update_state', function (func, self, dt, t)
    local lvl_key = Managers.state.game_mode:level_key()
    if lvl_key == mod.level_name then
        self._activation_allowed = true
    end
    return func(self, dt, t)
end)