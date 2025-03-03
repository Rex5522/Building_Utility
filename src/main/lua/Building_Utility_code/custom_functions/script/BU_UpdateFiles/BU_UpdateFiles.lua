function BU_UpdateFiles()
    if not g_savedata.users or not g_savedata.vehicles then
        BU_Debug("MAIN SAVE DATAS ARE NIL?!?!")
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

    versionCompatibility() -- help transfer old data to new

    compareTables(getFakeMiscData(), g_savedata.misc, true)

    compareTables(getFakeServerSettings(), g_savedata.serverSettings, true)

    updateClassFunctionsAndFix(g_savedata.users, userCommands, userClass:createUser("010101", "fakeName", 0, true))

    updateClassFunctionsAndFix(g_savedata.vehicles, vehicleCommands, vehicleClass:createVehicle(-1, -1, 0, true, {}, true))

    for steamID, user in pairs(G_Users) do
        user:handleNilVehicles()
    end
end