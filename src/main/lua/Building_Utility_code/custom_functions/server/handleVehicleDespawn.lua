--- updates the vehicle logs.
--- @param vehicleID string|integer -- The ID of the vehicle being despawned.
--- @param despawnerID string|integer -- The ID of the entity (player or system) that initiated the despawn action.
--- @return string|nil -- Returns the groupID of the vehicle's group if successful, or nil if no group or log data was found.
function handleVehicleDespawn(vehicleID, despawnerID)

    if not G_Misc or not G_VehicleLog then
        G_Reloaded = false
        BU_Reload()
    end

    local vehicleLogData = G_VehicleLog.vehicles[vehicleID]
    if not vehicleLogData then -- early return if this is a dupe despawn or delete the vehicle otherwise
        return nil
    end
    local groupID = vehicleLogData.groupID
    local groupLogData = G_VehicleLog.vehicleGroups[groupID]

    G_VehicleLog.vehicles[vehicleID] = nil
    BU_Debug("deleted vehicle " .. tostring(vehicleID) .. " from group "..tostring(groupID))

    if not groupLogData then
        BU_Debug("vehicle was found but group was not?!??!")
        return groupID
    end

    if groupLogData.groupVehicles then
        groupLogData.groupVehicles[vehicleID] = nil
        if tableLength(groupLogData.groupVehicles) == 0 then
            G_VehicleLog.vehicleGroups[groupID] = nil
            BU_Debug("deleted group " .. tostring(groupID) .. " from files")
        end
    end



    return groupID
end