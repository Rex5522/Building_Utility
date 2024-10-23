function spawnObject(data)
    local formatCommandData = {
        command = "?spawnobject",
        argData = {
            [1] = {
                argName = "targetObjectID",
                Description = "the id of the object you wish to spawn. use   ?spawnobject list   to list object ids",
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

    spawnCommandFunc(user, nil, targetObjectID, G_ObjectIDs, "object")
end