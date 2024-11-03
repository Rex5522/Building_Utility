function BU_UpdateFiles()
    if not g_savedata.users or not g_savedata.vehicles then
        BU_Debug("MAIN SAVE DATAS ARE NIL")
		return
 	end

     local playerList = server.getPlayers()

     for index, userData in pairs(playerList) do
        local user = getUserFromUserID(userData.id)
        if not user and tostring(userData.steam_id) ~= "0" then
            BU_Debug("a player was nil", userData)
            BU_Debug(G_Users)
            user = userClass:createUser(tostring(userData.steam_id), userData.name, userData.id, false)
        end
    end


    for steamID, user in pairs(g_savedata.users) do

        if user then
            -- remove old commands that not longer exist
            for dataName, data in pairs(user) do
                if type(data) == "function" and not userCommands[dataName] then
                    user[dataName] = nil
                end
            end
            
            -- add or update commands
            for name, func in pairs(userCommands) do
                user[name] = function(...) return func(user, ...) end
            end
            
            user:fixFile()
        else
            BU_Debug("user is nil for steamID: " .. tostring(steamID))
        end
    end

    for groupID,vehicle in pairs(g_savedata.vehicles) do
        -- remove old commands that not longer exist
        for dataName, data in pairs(vehicle) do
            if type(data) == "function" and not vehicleCommands[dataName] then
                    vehicle[dataName] = nil
            end
        end

        -- add or update commands
        for name, func in pairs(vehicleCommands) do
            vehicle[name] = function(...) return func(vehicle, ...) end
        end
    end
end