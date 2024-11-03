function CMDspawnAnimal(data)
    local formatCommandData = {
        command = "?spawnanimalt",
        argData = {
            [1] = {
                argName = "targetObjectID",
                Description = "the id of the object you wish to spawn. use ?spawnanimal list to list object ids",
                exampleValue = "25",
                required = true
            },
            
            [2] = {
                argName = "size",
                Description = "the size of the animal",
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

    spawnCommandFunc(user, size, targetObjectID, G_AnimalIDs, "animal")
end