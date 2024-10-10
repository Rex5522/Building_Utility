---gets the seated creatures in a group
---@param groupID any
---@return table
function getGroupSeatedCreatures(groupID)
    vehicles, success = server.getVehicleGroup(groupID)
    return getSeatedCreatures(vehicles) or nil
end