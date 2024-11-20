---gets the seated creatures in a group
---@param groupID any
---@return table
function getGroupSeatedCreatures(groupID)
    local vehicles, success = server.getVehicleGroup(groupID)
    return getSeatedCreatures(vehicles) or nil
end