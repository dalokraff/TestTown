local mod = get_mod("TestTown")

UtilFuncs = UtilFuncs or {}

UtilFuncs.radians_to_quaternion = function (theta, ro, phi)
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

UtilFuncs.spawn_local_unit = function (world, unit_name, position, orientation)
    local unit = World.spawn_unit(world, unit_name, position, orientation)

    return unit
end

UtilFuncs.spawn_local_unit_with_extensions = function (world, unit_name, unit_template_name, smart_object_name, position, rotation)
    local unit = UtilFuncs.spawn_local_unit(world, unit_name, position, rotation)
	-- unit_template_name = unit_template_name or Unit.get_data(unit, "unit_template")
    if unit_template then
        Unit.set_data(unit, 'unit_template', unit_template_name)
    end
    if smart_object_name then
        Unit.set_data(unit, 'smart_object_id', smart_object_name)
    end

    return unit
end

--for AI spawners
UtilFuncs.spawn_local_spawner = function (world, unit_name, position, rotation, spawner_settings)
    local unit = UtilFuncs.spawn_local_unit(world, unit_name, position, rotation)
    Unit.set_data(unit, "spawner_settings", "spawner1")
    for k,v in pairs(spawner_settings) do
        if type(v) == 'table' then
            print(k)
            for i,j in pairs(v) do
                Unit.set_data(unit, "spawner_settings", "spawner1", k, i-1, j)
            end
        else
            Unit.set_data(unit, "spawner_settings", "spawner1", k, v)
        end
    end
end

mod.boss_gizmo_id = 0
UtilFuncs.spawn_local_boss_spawner = function (world, unit_name, position, rotation, event_kind, travel_dist, map_section)
    local unit = UtilFuncs.spawn_local_unit(world, unit_name, position, rotation)
    mod:echo('spawn_local_boss_spawner')
    Unit.set_data(unit, 'travel_dist', travel_dist)
    Unit.set_data(unit, 'encampment_id', 0)
    Unit.set_data(unit, event_kind, true)
    -- Unit.set_data(unit, 'event_patrol', true)
    -- Unit.set_data(unit, 'event_boss', true)
    Unit.set_data(unit, 'id', mod.boss_gizmo_id)
    Unit.set_data(unit, "map_section", tonumber(map_section))

    local conflict_director = Managers.state.conflict
    conflict_director.level_analysis:boss_gizmo_spawned(unit)

    mod.boss_gizmo_id = mod.boss_gizmo_id + 1
    return unit
end

UtilFuncs.spawn_local_pickup_spawner = function (world, position, rotation, bonus_spawner, guaranteed_spawn, completion_percentage)
    local unit = UtilFuncs.spawn_local_unit( world, "units/hub_elements/pickup_spawner", position, rotation)
    Unit.set_data(unit, 'bonus_spawner', bonus_spawner)
    Unit.set_data(unit, "guaranteed_spawn", guaranteed_spawn)
    Unit.set_data(unit, 'percentage_through_level', completion_percentage)

    local entity_manager = Managers.state.entity
    local pickup_system = entity_manager:system("pickup_system")
    pickup_system:pickup_gizmo_spawned(unit)


    return unit
end

mod.respawn_units = {}
UtilFuncs.spawn_local_respawner = function (world, unit_name, position, rotation, distance_through_level, respawn_group_id, gate_enabled,
    flavour_animation, recovery_time)
    local unit = UtilFuncs.spawn_local_unit( world, unit_name, position, rotation)
    Unit.set_data(unit, 'distance_through_level', distance_through_level)
    Unit.set_data(unit, 'respawn_group_id', respawn_group_id)
    Unit.set_data(unit, 'gate_enabled', gate_enabled)
    Unit.set_data(unit, 'flavour_animation', flavour_animation)
    Unit.set_data(unit, 'recovery_time', recovery_time)

    local respawn_id = #mod.respawn_units + 1
    mod.respawn_units[respawn_id] = unit

    Unit.set_data(unit, 'respawn_id', respawn_id)


    local game_mode = Managers.state.game_mode
    game_mode:respawn_unit_spawned(unit)

    return unit
end

return UtilFuncs
