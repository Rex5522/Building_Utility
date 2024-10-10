function handleVehicleLogs(isSpawn, vehicleID, groupID, ownerID)
    if not G_VehicleLog then
        BU_Debug("attempted to handle vehicle logs before first reload")
        return
    end
    if isSpawn then
        local groupVehicles, success = server.getVehicleGroup(groupID)
        if success then


            local vehicleListedGroup = {}
            for index, listVehicleID in pairs(groupVehicles) do
                G_VehicleLog.vehicles[listVehicleID] = {
                    ownerID = ownerID,
                    groupID = groupID
                }

                vehicleListedGroup[listVehicleID] = true
            end 

            G_VehicleLog.vehicleGroups[groupID] = {
                ownerID = ownerID,
                groupID = groupID,
                mainBodyID = groupVehicles[1],
                groupVehicles = deepCopy(vehicleListedGroup)
            }

            return groupVehicles
        else
            BU_Debug("unable to get groupVehicles")
        end
    else
        local vehicleLogData = G_VehicleLog.vehicles[vehicleID]
        if not vehicleLogData then -- early return if this is a dupe despawn
            return nil
        end

        local groupID = vehicleLogData.groupID
        local groupLogData = G_VehicleLog.vehicleGroups[groupID]
        if not groupLogData then -- early return if this is a dupe despawn
            return groupID
        end

        G_VehicleLog.vehicles[vehicleID] = nil
        if groupLogData.groupVehicles then
            groupLogData.groupVehicles[vehicleID] = nil
            BU_Debug("deleted group vehicle file. vehicles in group: "..tableLength(groupLogData.groupVehicles))
        end

        BU_Debug(groupLogData.groupVehicles)
        if tableLength(groupLogData.groupVehicles) == 0 then
            G_VehicleLog.vehicleGroups[groupID] = nil
        end

        return groupID
    end
end