function CMD_Heal(data)
    local formatCommandData = {
        command = "?heal",
        argData = {
            [1] = {
                argName = "targetUserID",
                Description = "the user you wish to heal. or none to heal yourself",
                exampleValue = "5",
                required = false
            }
        }
    }

    local user = data.user
    local userToHeal = getUserFromUserID(data.arg1 or user.ID)

    if data.arg1 == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    if userToHeal then
        objectID = userToHeal:getObjectID()
        server.reviveCharacter(objectID)
        server.setCharacterData(objectID, 100, nil, nil)

        if user.ID ~= userToHeal.ID then
            userToHeal:display("you have been healed by a admin", true)
            user:display("healed " .. userToHeal.name, true)
        else
            userToHeal:display("you have been healed", true)
        end
    else
        user:display("unable to find user '" .. data.arg1 .. "' ", false)
    end
end