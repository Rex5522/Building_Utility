--- Handles the spawning of a vehicle group and logs the vehicles' information.
--- @param groupID string|integer -- The unique ID of the vehicle group to spawn.
--- @param ownerID string|integer -- The ID of the owner of the vehicle group.
--- @return table -- Returns the list of vehicle IDs in the group if successful.
function handleVehicleSpawn(groupID, ownerID)

    if not G_Misc or not G_VehicleLog then
        G_Reloaded = false
        BU_Reload()
    end

    local groupVehicles, success = server.getVehicleGroup(groupID)
    if not success then
        BU_Debug("ERROR: unable to get groupVehicles of vehicle group: "..tostring(groupID))
        return {}
    end

    local vehiclesInGroup = {}
    for index, VehicleID in pairs(groupVehicles) do
        G_VehicleLog.vehicles[VehicleID] = {
            ownerID = ownerID,
            groupID = groupID
        }

        vehiclesInGroup[VehicleID] = true
    end

    G_VehicleLog.vehicleGroups[groupID] = {
        ownerID = ownerID,
        groupID = groupID,
        mainBodyID = groupVehicles[1],
        groupVehicles = deepCopy(vehiclesInGroup)
    }

    BU_Debug("logged group spawn: ", G_VehicleLog.vehicleGroups[groupID])
    return groupVehicles
end