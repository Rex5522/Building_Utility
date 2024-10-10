--- gets vehicle object from groupID
-- @param groupID int,
-- @return vehicle object or nil
function getVehicleFromGroupID(groupID)
    vehicle = g_savedata.vehicles[tonumber(groupID)]
    if not vehicle then
        BU_Debug("vehicle group not found :"..tostring(groupID))
    end

    return vehicle
end