function CMDspawnCreature(data)
    local formatCommandData = {
        command = "?spawncreature",
        argData = {
            [1] = {
                argName = "targetID",
                Description = "the id of the creature you wish to spawn. use   ?spawncreature list   to list the ids",
                exampleValue = "25",
                required = true
            },
            
            [2] = {
                argName = "size",
                Description = "the size of the creature",
                exampleValue = "1",
                required = false
            }
        }
    }

    local user = data.user
    local targetObjectID = data.arg1
    local size = data.arg2

    if not targetObjectID or targetObjectID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    spawnCommandFunc(user, size, targetObjectID, G_CreatureIDs, "creature")
end