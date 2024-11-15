function onVehicleDespawn(vehicleID, despawnerID)
    local groupID = handleVehicleDespawn(vehicleID, despawnerID)

    local vehicle = getVehicleFromGroupID(groupID)
    if not vehicle then
        BU_Debug("vehicle not found. group: "..tostring(groupID),"vehicleID: "..tostring(vehicleID))
        return
    end



    vehicle:removeSubBody(vehicleID)
    if not (vehicle.totalBodys < 100) or (#vehicle.groupVehicles % 25 == 0) then -- to limit log spam
        BU_Debug("vehicle: "..vehicle.groupID.."'s SubBodies left: "..tostring(#vehicle.groupVehicles).."/"..vehicle.totalBodys)
    end

    if #vehicle.groupVehicles == 0 then
        server.removeMapObject(-1, groupID + 7000)
        BU_Debug("deleting vehicle "..vehicle.groupID)
        BU_Debug(#vehicle.groupVehicles)
        BU_Debug(vehicle)
        vehicle:delete()
    end
end