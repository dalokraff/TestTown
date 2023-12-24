local mod = get_mod("TestTown")




local create_hash_table = function(unit_hash)
    local hash_table = {}
    for i=1, string.len(unit_hash) do
        hash_table[#hash_table+1] = unit_hash:byte(i)
    end
    return hash_table
end

local mod = get_mod("CustomLevel")
-- mod:echo(#mod.units_to_add)
local lua_str = ''
local lua_table = 'local unit_tables = {\n'
local player = Managers.player:local_player()
local player_unit = player.player_unit
local position = Unit.local_position(player_unit,0)
local world = Managers.world:world("level_world")
local origin = Vector3(unpack(mod.units_to_add[1].pos)) - position
for indx,unit_data in pairs(mod.units_to_add) do
    local unit = Managers.state.unit_spawner:spawn_local_unit(
        string.char(unpack(unit_data.unit_hash)),
        Vector3(unpack(unit_data.pos))-origin,
        Quaternion.from_elements(unpack(unit_data.rot))
    )
    local unit_hash_table = create_hash_table(Unit.name_hash(unit))
    local unit_hash = ''
    for _,char in pairs(unit_hash_table) do
        unit_hash = unit_hash .. tostring(char) .. '_'
    end
    -- mod:echo(unit_hash)
    local unit_table = {
        tostring(cjson.encode(unit_data.unit_hash)),
        tostring(Vector3(unpack(unit_data.pos))-origin),
        tostring(Quaternion.from_elements(unpack(unit_data.rot)))
    }
    local lua_thing = 'local unitTable_'..tostring(indx)..' = {\n\t'

    lua_str = lua_str ..lua_thing.. tostring(cjson.encode(unit_data.unit_hash))..',\n\t'..tostring(Vector3(unpack(unit_data.pos))-origin)..',\n\t'..tostring(Quaternion.from_elements(unpack(unit_data.rot)))..'\n}\n'
    lua_table = lua_table..'\tunitTable_'..tostring(indx)..',\n'
    local json = cjson.encode(unit_table)

end
print(lua_str)
print(lua_table)


local travel_dist = {
    0,
    16.6346995832,
    15.115724563598633,
    16.189338684082031,
    19.455667495727539,
    28.52827262878418,
    7.3503875732421875,
    11.988923072814941,
    18.177633285522461,
    17.420413970947266,
    18.743648529052734,
    10.117861747741699,
    11.077975273132324,
    4.9673552513122559,
    4.2785754203796387,
    12.007821083068848,
    4.0806636810302734,
    7.6256399154663086,
}

local i = 0
for k,v in pairs(travel_dist) do
    i = i + v
end
print(i)