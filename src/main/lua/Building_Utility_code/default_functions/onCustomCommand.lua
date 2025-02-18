function onCustomCommand(fullMessage, userID, admin, auth, command, ...)

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
        admin = admin, -- use status instead
        auth = auth, -- use status instead
        command = command,
        user = user,
        status = user:getStatus()
    }

    for index, value in ipairs(args) do
        data["arg" .. index] = value:lower()
    end

    BU_Debug(data)
    local commandData = G_Commands[command]
    if commandData and data.status >= commandData.authLevel then
        commandData.func(data)
        return
    end


    display("command not found: "..command, userID, 6)
end