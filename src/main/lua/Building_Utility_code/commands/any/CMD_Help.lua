function CMD_Help(data)
    local user = data.user
    local text = ""
    local userAuthLevel = user:getStatus()
    local aliases = {
        [0] = "any",
        [1] = "auth",
        [2] = "admin"
    }

    commandText = {}

    for command, commandData in pairs(G_Commands) do
        local commandAuthLevel = commandData.authLevel

        if userAuthLevel >= commandAuthLevel then
            if commandText[commandAuthLevel] == nil then
                commandText[commandAuthLevel] = ""
            end
            commandText[commandAuthLevel] = commandText[commandAuthLevel] .. command .. " : " .. commandData.description .. "\n\n"
        end
    end

    for i = 0, 2 do
        if commandText[i] then
            local authLevel = i
            local commandtextData = commandText[i]
            text = "\n-------------" .. aliases[authLevel] .. "-------------\n" .. commandtextData .. text
        end
    end
    

    user:display("please read the in-game chat", true)
    user:display(text, nil, true)
end