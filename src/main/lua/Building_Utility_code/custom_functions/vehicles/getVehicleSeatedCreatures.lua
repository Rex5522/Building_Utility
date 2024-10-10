---gets seated creatures in a vehicle id
---@param vehicleID any
---@return table
function getVehicleSeatedCreatures(vehicleID)
    return getSeatedCreatures({[1] = vehicleID})
end