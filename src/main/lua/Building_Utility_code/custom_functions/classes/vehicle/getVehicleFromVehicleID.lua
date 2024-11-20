--- gets vehicle object from vehicleID
-- @param vehicleID
-- @return vehicle object or nil
function getVehicleFromVehicleID(vehicleID)
    local vehicleData, success = server.getVehicleData(vehicleID)
    if not success then
        BU_Debug("failed to get vehicle data. vehicle: "..tostring(vehicleID))
        return nil
    end

    local groupID = vehicleData.group_id

    return g_savedata.vehicles[groupID] or nil
end