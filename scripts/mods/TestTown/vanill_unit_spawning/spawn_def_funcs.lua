local mod = get_mod("TestTown")
local UtilFuncs = mod:dofile("scripts/mods/TestTown/vanill_unit_spawning/util_funcs")

SpawnDefinitionsFuncs = SpawnDefinitionsFuncs or {}

local sewer_spawner_hash_table = {
    3, 200, 96, 54, 210, 65, 49, 208
}
local sewer_spawner_unit_hash_str = string.char(unpack(sewer_spawner_hash_table))

local sewer_spawner_hatch_hash_table = {
    93, 213, 88, 189, 109, 1, 222, 155
}
local sewer_spawner_hatch_unit_hash_str = string.char(unpack(sewer_spawner_hatch_hash_table))

local arrow_spawner_hash_table = {
    169, 112, 180, 219, 221, 43, 100, 176
}
local arrow_spawner_unit_hash_str = string.char(unpack(arrow_spawner_hash_table))

local star_spawner_hash_table = {
    33, 117, 185, 13, 198, 123, 32, 171
}
local star_spawner_unit_hash_str = string.char(unpack(star_spawner_hash_table))

local window_spawner_hash_table = {
    163, 118, 14, 103, 165, 52, 69, 250
}
local window_spawner_unit_hash_str = string.char(unpack(window_spawner_hash_table))

local levelend_unit_hash = {
    58, 184, 122, 132, 212, 139, 41, 120
}
local levelend_unit_hash_str = string.char(unpack(levelend_unit_hash))

local wayston_unit_hash = {
    111, 208, 98, 253, 154, 223, 174, 8
}
local wayston_unit_hash_str = string.char(unpack(wayston_unit_hash))

local window_spawner_hash_table = {
    163, 118, 14, 103, 165, 52, 69, 250
}
local window_spawner_unit_hash_str = string.char(unpack(window_spawner_hash_table))

local ledge_unit_hash_table = {
    1, 112, 165, 9, 212, 94, 230, 252
}
local ledge_unit_hash_str = string.char(unpack(ledge_unit_hash_table))

local house_door_unit_hash = {
    76, 173, 234, 217, 62, 142, 102, 206
}
local three_arches_house_unit_hash = {
    89, 25, 191, 127, 100, 56, 24, 174
}
local small_stone_house_unit_hash = {
    47, 118, 125, 51, 89, 73, 68, 100
}
local skinny_house_01_unit_hash = {
    146, 87,41,128,182,186,218,131
}
local skinny_house_02_unit_hash = {
    171, 62, 191, 191, 245, 137, 209, 151
}
local overhang_house_unit_hash = {
    162, 14, 109, 120, 203, 217, 72, 177
}
local house_dome_unit_hash = {
    245, 80, 200, 165, 120, 253, 254, 82
}
local house_top_unit_hash = {
    203, 137, 170, 191, 17, 142, 127, 156
}
local house_small_01_unit_hash = {
    55, 35, 43, 17, 151, 111, 98, 248
}
local house_door_unit_hash_str = string.char(unpack(house_door_unit_hash))
local three_arches_house_unit_hash_str = string.char(unpack(three_arches_house_unit_hash))
local small_stone_house_unit_hash_str = string.char(unpack(small_stone_house_unit_hash))
local skinny_house_01_unit_hash_str = string.char(unpack(skinny_house_01_unit_hash))
local skinny_house_02_unit_hash_str = string.char(unpack(skinny_house_02_unit_hash))

local wall_unit_hash = {14,208,217,124,74,97,66,111}
local wall_unit_hash_str = string.char(unpack(wall_unit_hash))
local house_top_unit_hash = {203, 137, 170, 191, 17, 142, 127, 156}
local house_top_unit_hash_str = string.char(unpack(house_top_unit_hash))
local floor_tile_hash = {9,100,135,252,224,221,126,144}
local floor_tile_unit_hash_str = string.char(unpack(floor_tile_hash))
local floor_ground_unit_hash = {204,42,34,99,60,56,249,32}
local floor_ground_unit_hash_str = string.char(unpack(floor_ground_unit_hash))
local cellar_door_hash = {253,215,125,201,20,247,211,19}
local cellar_door_unit_str = string.char(unpack(cellar_door_hash))
local tower_unit_hash = {97, 113, 251, 245, 125, 5, 166, 160}
local tower_unit_str = string.char(unpack(tower_unit_hash))
local large_wall_unit_hash = {190, 220, 158, 210, 74, 132, 166, 38}
local large_wall_unit_str = string.char(unpack(large_wall_unit_hash))
local large_wall_stairs_unit_hash = {137, 98, 189, 206, 21, 238, 206, 212}
local large_wall_stairs_unit_str = string.char(unpack(large_wall_stairs_unit_hash))
local ledge_unit_hash_table = {1, 112, 165, 9, 212, 94, 230, 252}
local ledge_unit_hash_str = string.char(unpack(ledge_unit_hash_table))
local ledge_2_unit_hash_table = {250, 116, 241, 197, 78, 67, 24, 67}
local ledge_2_unit_hash_str = string.char(unpack(ledge_unit_hash_table))
local star_spawner_hash_table = {33, 117, 185, 13, 198, 123, 32, 171}
local star_spawner_unit_hash_str = string.char(unpack(star_spawner_hash_table))

local boss_spawner_hash_table = {28, 39, 27, 215, 193, 234, 17, 243}
local boss_spawner_unit_hash_str = string.char(unpack(boss_spawner_hash_table))

local respawn_unit_hash_table = {128, 200, 131, 71, 118, 31, 190, 180}
local respawn_unit_hash_str = string.char(unpack(respawn_unit_hash_table))

--========================================================
-- Functions for spawning in my vanilla units
--========================================================

--spawns meshes before ConflictDirector initialization
SpawnDefinitionsFuncs.spawn_testing_mesh = function (position, world)
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position)
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(6,0,0), UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-6,0,0), UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(-1,6,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(-7,-6,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(12,0,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(9,-6,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(9,-12,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(9,-21,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(5,-21,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(-8,-21,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_01", position+Vector3(-10,-28.5,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(1,-29,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(-10,-36.5,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_01", position+Vector3(-21,-3.5,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position+Vector3(-15,-3.5,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-29,-3.5,0),UtilFuncs.radians_to_quaternion(0,-math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-43,-3.5,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_05", position+Vector3(-35,-3.5,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position+Vector3(-43,-10,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_01", position+Vector3(-43,-15,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(-43,-30,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_04", position+Vector3(-48,-23,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(-43,-39,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-41,-48,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(-34,-48,-7),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(-24,-32,-0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-34,-55,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(-20,-55,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, skinny_house_02_unit_hash_str, position+Vector3(-9.5,-55,0),UtilFuncs.radians_to_quaternion(0,3*math.pi/4,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(0,-55,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(5,-42,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position+Vector3(10,-42,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(15,-40,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(25,-43.5,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position+Vector3(32,-44,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(30.5,-34,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(37.5,-39.5,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(28,-23,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, small_stone_house_unit_hash_str, position+Vector3(18,-15,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(13,-19,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_03", position+Vector3(19,-3,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_02", position+Vector3(25,-1,0),UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, skinny_house_01_unit_hash_str, position+Vector3(32,-3,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_01", position+Vector3(36,-3,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(40,-7,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, skinny_house_01_unit_hash_str, position+Vector3(45,-14,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, skinny_house_01_unit_hash_str, position+Vector3(45.5,-18,0),UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(48,-24,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(58,-30,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(59,-40.5,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(39,-60,0),UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, small_stone_house_unit_hash_str, position+Vector3(35,-50,0),UtilFuncs.radians_to_quaternion(0,math.pi,0))

    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, position+Vector3(3.5, -53.5, 0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, position+Vector3(3.5, -45.5, 0), UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))

    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, position+Vector3(-25, -55, 0), UtilFuncs.radians_to_quaternion(0,math.pi,0))

    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, position+Vector3(-40, -9, 0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, position+Vector3(-40.75,-5,0), UtilFuncs.radians_to_quaternion(0,0,0))

    local unit = UtilFuncs.spawn_local_unit(world, large_wall_stairs_unit_str, position+Vector3(8,2,-11)+Vector3(51, -55, 0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, large_wall_stairs_unit_str, position+Vector3(8,-5,-7.5)+Vector3(51, -55, 0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, tower_unit_str, position+Vector3(8,-9,-10)+Vector3(51, -55, 0), UtilFuncs.radians_to_quaternion(0,0,0))
    local unit = UtilFuncs.spawn_local_unit(world, large_wall_stairs_unit_str, position+Vector3(4,-9,-7.5)+Vector3(51, -55, 0), UtilFuncs.radians_to_quaternion(0,math.pi,0))
    local unit = UtilFuncs.spawn_local_unit(world, large_wall_unit_str, position+Vector3(-4,-18,-9)+Vector3(51, -55, 0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))

    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(64,-32.5,0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(71,-43,0), UtilFuncs.radians_to_quaternion(0,math.pi*0,0))
    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(65.5,-57,0), UtilFuncs.radians_to_quaternion(0,math.pi*0,0))

    local unit = UtilFuncs.spawn_local_unit(world, three_arches_house_unit_hash_str, position+Vector3(80.5,-36.85,0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, skinny_house_02_unit_hash_str, position+Vector3(78.5,-56.5,0), UtilFuncs.radians_to_quaternion(0,math.pi*3/4,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_07", position+Vector3(85,-51,0), UtilFuncs.radians_to_quaternion(0,math.pi*2/4,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_08", position+Vector3(82.5,-44,0), UtilFuncs.radians_to_quaternion(0,-math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_house_09", position+Vector3(75,-25,0), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))
    local unit = UtilFuncs.spawn_local_unit(world, tower_unit_str, position+Vector3(69,-31,-5), UtilFuncs.radians_to_quaternion(0,math.pi/2,0))

    local unit = UtilFuncs.spawn_local_unit(world, wall_unit_hash_str, Vector3(11.9, -3.56109, 60), UtilFuncs.radians_to_quaternion(0,0,0))


    for i=-10, 8, 1 do
        for j=-17, 11, 1 do
            -- if j == 0 and i == 2 then
            if j == 0 and i == 100 then
                print('skipped')
            else
                local unit = UtilFuncs.spawn_local_unit(world, "units/architecture/town/town_walkway_03", position+Vector3(-5-j*5.5,-29-i*5.5,-0.6),UtilFuncs.radians_to_quaternion(0,0,0))
            end
        end
    end


    --spawning smart objects
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        "units/navigation/climb_units/climb_unit_edge",
        'navgraphconnector',
        'ledge-1',
        Vector3(-19.6724, -10.6339, 66.4837),
        UtilFuncs.radians_to_quaternion(0,0,0)
    )
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        "units/navigation/climb_units/climb_unit_edge",
        'navgraphconnector',
        'ledge-1',
        Vector3(1.77868, -21.8897, 66.067),
        UtilFuncs.radians_to_quaternion(0,0,0)
    )
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        "units/navigation/climb_units/climb_unit_edge",
        'navgraphconnector',
        'ledge-1',
        Vector3(-17.127, -29.4656, 66.4798),
        UtilFuncs.radians_to_quaternion(0,math.pi/2,0)
    )
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        "units/navigation/climb_units/climb_unit_edge",
        'navgraphconnector',
        'ledge-1',
        Vector3(7.62657, -29.0867, 66.5313),
        UtilFuncs.radians_to_quaternion(0,math.pi/2,0)
    )
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        "units/navigation/climb_units/climb_unit_edge",
        'navgraphconnector',
        'ledge-1',
        Vector3(39.7024, -13.508, 66.6042),
        UtilFuncs.radians_to_quaternion(0,0,0)
    )
    local unit = UtilFuncs.spawn_local_unit_with_extensions(
        world,
        ledge_2_unit_hash_str,
        'navgraphconnector',
        'ledges-fences-1',
        Vector3(3.23029, -49.7623, 62.7833),
        UtilFuncs.radians_to_quaternion(0,math.pi/2,0)
    )

    --spawnign ai spwners
    local star_spawner_settings = {
        hidden = true,
        enabled = true,
        node = 'a_spawner_start',
        spawn_rate = 1,
        animation_events = {
            'spawn_idle'
        }
    }
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        Vector3(-20.7639, -3.07883, 66.416),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        Vector3(-14.4323, -27.3032, 66.4419),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(0.886639, -29.0318, 7.2098),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(39.6806, -8.33611, 7.2198),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(12.4705, -54.8075, 0),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(-23.5812, -60.9585, 0),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(34.3871, -51.2785, 5.1432),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        star_spawner_unit_hash_str,
        position+Vector3(76.037, -26.1628, 7.206),
        UtilFuncs.radians_to_quaternion(0,0,0),
        star_spawner_settings
    )


    local window_spawner_settings = {
        enabled = true,
        node = 'a_spawner_start',
        spawn_rate = 1,
        animation_events = {
            'spawn_window',
            'spawn_window_2'
        }
    }
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-28.9253, -7.30044, 64.3599)+Vector3(-1, -0.25, 0.8),
        UtilFuncs.radians_to_quaternion(0,math.pi,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-23.5, -25.5, 65),
        UtilFuncs.radians_to_quaternion(0,0,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-39, -16.75, 65),
        UtilFuncs.radians_to_quaternion(0,-math.pi/2,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(37.143, -8.94663, 64.4731),
        UtilFuncs.radians_to_quaternion(0,math.pi/2,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(43.8639, -25.1759, 65.0596),
        UtilFuncs.radians_to_quaternion(0,math.pi/2,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(0.0026, -51.0521, 65.4428),
        UtilFuncs.radians_to_quaternion(0,0,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(3.06319, -33.2412, 65.1986),
        UtilFuncs.radians_to_quaternion(0,math.pi,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-1.06319, -33.2412, 65.1986),
        UtilFuncs.radians_to_quaternion(0,math.pi,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-5.56319, -38.6, 65.1986),
        UtilFuncs.radians_to_quaternion(0,-math.pi/2,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-16.6051, -51.2036, 65),
        UtilFuncs.radians_to_quaternion(0,0,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-23.1051, -51.2036, 65),
        UtilFuncs.radians_to_quaternion(0,0,0),
        window_spawner_settings
    )
    local unit = UtilFuncs.spawn_local_spawner(
        world,
        window_spawner_unit_hash_str,
        Vector3(-19.3551, -51.2036, 65),
        UtilFuncs.radians_to_quaternion(0,0,0),
        window_spawner_settings
    )

    local waystone_unit = UtilFuncs.spawn_local_unit( world, wayston_unit_hash_str, Vector3(76.6423, -47.9398, 59.7086), UtilFuncs.radians_to_quaternion(0,0,0))
    Unit.set_data(waystone_unit, "visible_from_start", true)
    -- Unit.set_data(waystone_unit, "disable_complete_level", true)
    Unit.set_data(waystone_unit, "always_activated", true)
    Unit.set_data(waystone_unit, "waystone_type", 1)


    mod.respawn_units ={}
    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(-24.122, -29.9096, 59.7082), nil, 10, nil, nil, 'respawn_floor_loop', 1.5)
    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(-21.8747, -31.4356, 59.7081), nil, 10, nil, nil, 'respawn_floor_loop', 1.5)
    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(-20.7899, -29.9728, 59.708), nil, 10, nil, nil, 'respawn_floor_loop', 1.5)

    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(14.614, -10.8809, 59.7079), nil, 50, nil, nil, 'respawn_floor_loop', 1.5)
    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(16.6536, -11.3016, 59.6987), nil, 50, nil, nil, 'respawn_floor_loop', 1.5)
    local unit = UtilFuncs.spawn_local_respawner(world, respawn_unit_hash_str, Vector3(19.2307, -11.2793, 59.7079), nil, 50, nil, nil, 'respawn_floor_loop', 1.5)

    mod:echo(unit)

end

--spawns meshes after ConflictDirector initialization
SpawnDefinitionsFuncs.spawn_dependant_units = function (position, world)
    local unit = UtilFuncs.spawn_local_boss_spawner(
        world,
        boss_spawner_unit_hash_str,
        position + Vector3(-33.6169, -48.1714, 0.2169),
        UtilFuncs.radians_to_quaternion(0,0,0),
        'event_patrol',
        0,
        1
    )
    -- Unit.set_data(unit, 'travel_dist', 21)

    local unit = UtilFuncs.spawn_local_boss_spawner(
        world,
        boss_spawner_unit_hash_str,
        position + Vector3(-20.838, -5.02485, 6.4361),
        UtilFuncs.radians_to_quaternion(0,0,0),
        'event_boss',
        0,
        1
    )
    -- Unit.set_data(unit, 'travel_dist', 5)

    local unit = UtilFuncs.spawn_local_boss_spawner(
        world,
        boss_spawner_unit_hash_str,
        position + Vector3(74.7615, -24.2644, 7.2033),
        UtilFuncs.radians_to_quaternion(0,0,0),
        'event_boss',
        0,
        2
    )
    -- Unit.set_data(unit, 'travel_dist', 60)

end

SpawnDefinitionsFuncs.spawn_pickup_units = function(position, world)
    local unit = UtilFuncs.spawn_local_pickup_spawner(
        world,
        position+Vector3(3.65171, -4.98714, -0.2),
        UtilFuncs.radians_to_quaternion(0,0,0),
        false,
        true,
        0.1
    )

    local unit = UtilFuncs.spawn_local_pickup_spawner(
        world,
        position+Vector3(-47.1609, -22.5911, -0.2),
        UtilFuncs.radians_to_quaternion(0,0,0),
        false,
        true,
        10
    )

    local unit = UtilFuncs.spawn_local_pickup_spawner(
        world,
        position+Vector3( -5.67307, -51.5668, -0.2),
        UtilFuncs.radians_to_quaternion(0,0,0),
        false,
        true,
        15
    )


end

return SpawnDefinitionsFuncs
