function onCustomCommand(fullMessage, userID, admin, auth, command, ...)

    local userAuthLevel = (function() if admin then return 2 elseif auth then return 1 else return 0 end end)()


    if command == "?!FULLRESET!" and admin then
        g_savedata = {}
        onCreate(true)
        return
    end

    command = command:lower()

    if command == "?save" or userID == -1 then
        return
    end

    local args = {...}

    local user = getUserFromUserID(userID)
    
    if not user then
        BU_Debug("attempting to create a user that was nil")
        user = userClass:createUserWithUserID(userID)
    end

    if not user then
        BU_Debug("FAILED TO CREATE USER")
        return
    end


    local data = {
        fullMessage = fullMessage,
        userID = userID,
        admin = admin,
        auth = auth,
        command = command,
        user = user
    }

    for index, value in ipairs(args) do
        data["arg" .. index] = value:lower()
    end

    BU_Debug(data)
    local commandData = G_Commands[command]
    if commandData and userAuthLevel >= commandData.authLevel then
        commandData.func(data)
        return
    end


    display("command not found: "..command, userID, 6)
end