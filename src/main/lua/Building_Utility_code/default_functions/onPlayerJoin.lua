function onPlayerJoin(steamID, name, userID, admin, auth)
    BU_Debug("start of onplayerjoin", steamID, name, userID, admin, auth)
    steamID = tostring(steamID)
    
    if userID == -1 then
        G_ServerSettings.dedicatedServer = true
        BU_Debug("onplayerjoin returned")
        return
    end


    local user = getUserFromSteamID(steamID)
    if not user then
        user = userClass:createUser(steamID, name, userID)
    end
    
    if not user then
        BU_Debug("onplayerjoin returned2")
        return
    end
    
    delayCommand(function() userCommands:fixName(user) end, 500)
    user.ID = userID

    if (user.bans == 0 and not auth and G_ServerSettings.autoAuth) then
        BU_Debug("attempting to auth userID: "..tostring(userID))
        delayCommand(server.addAuth, 5, userID)
    else
        BU_Debug("not attempting to auth userID: "..tostring(userID))
    end
    BU_Debug("end of onplayerjoin")
end