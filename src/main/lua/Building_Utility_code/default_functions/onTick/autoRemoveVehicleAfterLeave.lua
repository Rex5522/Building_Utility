function autoRemoveVehicleAfterLeave()
    if G_Tick % 3600 == 0 then
        for userID, user in pairs(G_userActivityList.notActive) do
            local ErrorTicks = 100 -- to help when the script is reloaded and some tick data is lost
            if ((user.playerGoneForXTicks + ErrorTicks) / 3600) >= G_ServerSettings.autoRemoveVehicleAfterLeaveDelay and G_ServerSettings.autoRemoveVehicleAfterLeaveDelay ~= 0 then
                local vehiclesGroupsToDespawn = {}
                for _, GroupID in pairs(user.vehicles) do
                    table.insert(vehiclesGroupsToDespawn, GroupID)
                end

                for index, groupID in pairs(vehiclesGroupsToDespawn) do
                    server.despawnVehicleGroup(groupID, true)
                    BU_Debug("deleting vehicle as user has left.", "user: "..user.steamID, "groupID: "..tostring(groupID))
                end
            end
        end
    end
end