--- updates the vehicle logs.
--- @param vehicleID string|integer -- The ID of the vehicle being despawned.
--- @param despawnerID string|integer -- The ID of the entity (player or system) that initiated the despawn action.
--- @return string|nil -- Returns the groupID of the vehicle's group if successful, or nil if no group or log data was found.
function handleVehicleDespawn(vehicleID, despawnerID)
    if not G_VehicleLog then
        BU_Debug("attempted to handle vehicle logs before first reload")
        return nil
    end

    local vehicleLogData = G_VehicleLog.vehicles[vehicleID]
    if not vehicleLogData then -- early return if this is a dupe despawn or delete the vehicle otherwise
        return nil
    else
        BU_Debug("deleted vehicle from vehicles: " .. tostring(vehicleID))
        G_VehicleLog.vehicles[vehicleID] = nil
    end

    local groupID = vehicleLogData.groupID
    local groupLogData = G_VehicleLog.vehicleGroups[groupID]
    if not groupLogData then
        BU_Debug("vehicle was found but group was not?!??!")
        return groupID
    end

    if groupLogData.groupVehicles then
        groupLogData.groupVehicles[vehicleID] = nil
        BU_Debug("deleted group vehicle from group. vehicles remaining in group: " .. tableLength(groupLogData.groupVehicles))
    end

    if tableLength(groupLogData.groupVehicles) == 0 then
        BU_Debug("logged group despawen: ", G_VehicleLog.vehicleGroups)
        G_VehicleLog.vehicleGroups[groupID] = nil
    end

    return groupID
end