function spawnCharacter(data)
    local formatCommandData = {
        command = "?spawncharacter",
        argData = {
            [1] = {
                argName = "targetID",
                Description = "the id of the character type you wish to spawn. use   ?spawncharacter list   to list the ids",
                exampleValue = "25",
                required = true
            }
        }
    }

    local user = data.user
    local targetObjectID = data.arg1

    if not targetObjectID or targetObjectID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    spawnCommandFunc(user, nil, targetObjectID, G_CharacterOutfitTypes, "character")
end