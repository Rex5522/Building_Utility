function onPlayerJoin(steamID, name, userID, admin, auth)
    BU_Debug("start of onplayerjoin", steamID, name, userID, admin, auth)

    steamID = tostring(steamID)

    if steamID == "0" then
        G_ServerSettings.dedicatedServer = true
        BU_Debug("dedicated server default user joined")
        return
    end

    local user = getUserFromSteamID(steamID)
    if not user then
        BU_Debug("user not found. creating user")
        user = userClass:createUser(steamID, name, userID)

        local welcomeMessage = "welcome to " .. G_ScriptName .. "!\ntype ?help for a list of commands\n(pssst! use ?? or ?c to despawn your newest vehicle)"

        user:display(welcomeMessage, true)
        user:display(welcomeMessage, true, true)
    else
        BU_Debug("user found")
    end

    if not user then
        BU_Debug("unable to create user")
        return
    end

    delayCommand(function() userCommands:fixName(user) end, 500)
    user.ID = userID
    g_savedata.steamIDs[userID] = steamID

    local adminUser = tableContains(G_Admins, tonumber(steamID)) ~= nil and not admin

    if (user.bans == 0 and not auth and G_ServerSettings.autoAuth and not adminUser) then
        BU_Debug("attempting to auth userID: "..tostring(userID))
        delayCommand(server.addAuth, 5, userID)
    elseif adminUser then
        delayCommand(server.addAdmin, 5, userID)
    else
        BU_Debug("not attempting to auth userID: "..tostring(userID))
    end

    BU_Debug("end of onplayerjoin")
end