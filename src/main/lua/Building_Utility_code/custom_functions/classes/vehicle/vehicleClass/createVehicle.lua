--- creates a vehicle object
-- @param groupID any,
-- @param onwerID any,
-- @param cost int,
-- @param antisteal bool,
-- @param groupvehicles table, a list of the vehicles sub bodys
-- @return vehicle object
function vehicleClass:createVehicle(groupID, ownerID, cost, antiSteal, groupVehicles)
    local vehicle = {
        type = "vehicle",
        groupID = groupID,
        ownerID = ownerID,
        cost = cost,
        antiSteal = antiSteal,
        totalBodys = #groupVehicles,
        ownerAutoSeated = false,
        mainBodyID = groupVehicles[1],
        vehicleLocationSpawned = false,
        groupVehicles = groupVehicles,
        workshopVehicle = false,
        isOwnerOfWorkshopVehicle = false,
        userLocationDuringSpawn = matrix.identity(),
        teleportUsersToSeat = { -- for users that are being teleported with the vehicle
            -- [vehicleID] = {
            --     [index] = seatData
            -- }
        }
    }
    
    for key, value in pairs(vehicleCommands) do
        vehicle[key] = function(...) return value(vehicle, ...) end
    end
    
    g_savedata.vehicles[vehicle.groupID] = deepCopy(vehicle)
    
    return g_savedata.vehicles[vehicle.groupID]
end