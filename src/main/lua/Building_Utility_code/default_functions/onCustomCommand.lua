function onCustomCommand(fullMessage, userID, admin, auth, command, ...)

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

    if admin and G_Commands.admin[command] ~= nil then
        G_Commands.admin[command](data)
        return
    end

    if auth and G_Commands.auth[command] ~= nil then
        G_Commands.auth[command](data)
        return
    end

    if G_Commands.any[command] ~= nil then
        G_Commands.any[command](data)
        return
    end

    display("command not found: "..command, userID, 6)
end