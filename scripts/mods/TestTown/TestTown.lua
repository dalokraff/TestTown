local mod = get_mod("TestTown")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de

mod.level_name = "VersuchenStadt"
mod.level_package_name = "resource_packages/TestTown/TestTown"
mod.path_to_level = "level/TestTown/world"

mod:dofile('scripts/mods/TestTown/settings/level_settings')
mod:dofile('scripts/mods/TestTown/settings/area_settings')
mod:dofile('scripts/mods/TestTown/hooks')
-- local path_to_level = "content/levels/test_level"

mod:command(mod.level_name, "Load into the custom level", function()
	mod.aiSpawners = {}
    mod.ledge_units = {}
    Managers.state.game_mode:start_specific_level(mod.level_name)
end)

mod:command('gotwf', "Load into the custom level", function()
	mod.aiSpawners = {}
    mod.ledge_units = {}
    Managers.state.game_mode:start_specific_level('gotwf')
end)

-- Managers.state.game_mode:start_specific_level('sig_citadel_tzeentch_path2')
-- Managers.state.game_mode:start_specific_level('ussingen_demo')


--========================================================
--========================================================
--========================================================
--========================================================
--========================================================

local create_hash_table = function(unit_hash)
    local hash_table = {}
    for i=1, string.len(unit_hash) do
        hash_table[#hash_table+1] = unit_hash:byte(i)
    end
    return hash_table
end

-- local create_unit_storage_table = function(unit)
--     if Unit.id32(unit) and Unit.alive(unit) then
--         local unit_entry = {
--             unit_hash = create_hash_table(Unit.name_hash(unit)),
--             pos = { Vector3.to_elements(Unit.local_position(unit,0)) },
--             rot = { Quaternion.to_elements(Unit.local_rotation(unit,0)) },
--             scale = { Vector3.to_elements(Unit.local_scale(unit,0)) }
--         }
--         return unit_entry
--     end
--     return nil
-- end



--========================================================
-- Unit names as bytes
--========================================================


mod:hook(_G, 'flow_callback_boss_gizmo_spawned', function(func, params)
    local result = func(params)

    local conflict_director = Managers.state.conflict

    local terror_spawners = conflict_director.level_analysis.terror_spawners

    for event, data in pairs(terror_spawners) do
        local spawners = data.spawners
        for index,spawn_data in ipairs(spawners) do
            mod:echo(index)
            for k,v in pairs(spawn_data) do
                mod:echo(k..'   '..tostring(v))
            end
        end
    end

    mod:echo('=================================')

    return results
end)

-- local function radians_to_quaternion(theta, ro, phi)
--     local c1 =  math.cos(theta/2)
--     local c2 = math.cos(ro/2)
--     local c3 = math.cos(phi/2)
--     local s1 = math.sin(theta/2)
--     local s2 = math.sin(ro/2)
--     local s3 = math.sin(phi/2)
--     local x = (s1*s2*c3) + (c1*c2*s3)
--     local y = (s1*c2*c3) + (c1*s2*s3)
--     local z = (c1*s2*c3) - (s1*c2*s3)
--     local w = (c1*c2*c3) - (s1*s2*s3)
--     local rot = Quaternion.from_elements(x, y, z, w)
--     return rot
-- end
-- local basement_units = mod:dofile('scripts/mods/TestTown/stair_piece')
-- local mod = get_mod("TestTown")
-- local player = Managers.player:local_player()
-- local player_unit = player.player_unit
-- local position = Unit.local_position(player_unit, 0) + Vector3(0,0,1)
-- local world = Managers.world:world("level_world")

-- local respawn_unit_hash_table = {
--     128, 200, 131, 71, 118, 31, 190, 180
-- }
-- local respawn_unit_hash_str = string.char(unpack(respawn_unit_hash_table))

-- if Unit.alive(mod.last_unit) then
--     Managers.state.unit_spawner:mark_for_deletion(mod.last_unit)
-- end

-- local unit = Managers.state.unit_spawner:spawn_local_unit( respawn_unit_hash_str, position, radians_to_quaternion(0,0,0))
-- Unit.set_unit_visibility(unit, true)
-- mod.last_unit = unit



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

-- local mod = get_mod("TestTown")
mod:command("ledge", "", function(radians)
    local player = Managers.player:local_player()
    local player_unit = player.player_unit
    local position = Unit.local_position(player_unit, 0)
    local world = Managers.world:world("level_world")
    local ledge_unit_hash_table = {
        1, 112, 165, 9, 212, 94, 230, 252
    }
    local ledge_unit_hash_str = string.char(unpack(ledge_unit_hash_table))

    if Unit.alive(mod.last_unit) then
        Managers.state.unit_spawner:mark_for_deletion(mod.last_unit)
    end
    local rads = tonumber(radians or 0)
    local unit = Managers.state.unit_spawner:spawn_local_unit( "units/navigation/climb_units/climb_unit_edge", position, radians_to_quaternion(0,math.pi*rads,0))
    Unit.set_unit_visibility(unit, true)
    mod:echo(position)
    mod.last_unit = unit
end)
