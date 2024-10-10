function onVehicleLoad(vehicleID) -- limit debugs as this function is used a LOT
    local vehicle = getVehicleFromVehicleID(vehicleID)
    if not vehicle then
        return
    end

    local owner = getUserFromUserID(vehicle.ownerID)
    if not owner then
        BU_Debug("NO OWNER: vehicle loaded with no owner")
        return
    end

    if vehicle.teleportUsersToSeat[vehicleID] then
        for index, seatData in ipairs(vehicle.teleportUsersToSeat[vehicleID]) do
            server.setSeated(seatData.seated_id, seatData.vehicleID, seatData.pos.x, seatData.pos.y, seatData.pos.z)
            BU_Debug(seatData)
            table.remove(vehicle.teleportUsersToSeat[vehicleID], index)
        end
    end

    if vehicle.totalBodys < 100 then
        vehicle:autoSeat()
    end
end