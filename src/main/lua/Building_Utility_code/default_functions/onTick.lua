function onTick(tick)
    G_Tick = G_Tick + 1
    updateUserActivityList()

    if G_Tick % 5 == 0 then
        updatePositions()
    end

    for vehicleID, data in pairs(g_savedata.vehicleDebugData.vehicles) do
        local vehicleExists = not vehicleGroupExist(vehicleID) and not vehicleExist(vehicleID)
        updateObjectPos(data, server.getVehiclePos, vehicleID)
        if vehicleExists then
            for userID, _ in pairs(g_savedata.vehicleDebugData.vehicles[vehicleID].usedBy) do
                local user = getUserFromUserID(userID)
                g_savedata.vehicleDebugData.commands.removeUser(user, vehicleID)
            end
            g_savedata.vehicleDebugData.vehicles[vehicleID] = nil
        end
    end

    autoRemoveVehicleAfterLeave()

    for userID, user in pairs(G_userActivityList.active) do
        if G_Tick % 5 == 0 then
            user:updateHud()
        end

        regen(user)
    end

    if G_Tick % 60 == 0 then
        getTPS()
    end
    delayCommand()
end