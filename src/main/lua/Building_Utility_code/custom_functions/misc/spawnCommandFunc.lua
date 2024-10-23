function spawnCommandFunc(user, size, targetID, targetList, typeOfTarget)

    if targetID == "list" then
        local listOfStuff = ""
        for index, indexData in pairs(targetList) do
            listOfStuff = listOfStuff.."id: "..tostring(index).."    "..typeOfTarget.."Name: "..indexData.name.."\n"
        end

        user:display(listOfStuff, nil, true)
        return
    end

    local resultObjectID
    local success
    if targetList[tonumber(targetID)] then
        local userLocation = user:getLocation(3)

        if typeOfTarget == "character" then
            resultObjectID, success = server.spawnCharacter(userLocation, targetID)
        elseif typeOfTarget == "animal" then
            resultObjectID, success = server.spawnAnimal(userLocation, targetID, size or 1)
        elseif typeOfTarget == "creature" then
            resultObjectID, success = server.spawnCreature(userLocation, targetID, size or 1)
        elseif typeOfTarget == "object" then
            resultObjectID, success = server.spawnObject(userLocation, targetID)
        else
            BU_Debug("INVALID ARG for type of target: \""..tostring(typeOfTarget).."\"")
        end

    else
        user:display(typeOfTarget.."ID \""..tostring(targetID).."\" does not exist", false)
        return
    end



    if success then
        local message = string.format("spawned %s\nname: %s\nID: %s",
        typeOfTarget, targetList[tonumber(targetID)].name, targetID)

        if size then
            message = message.."\nsize: "..size
        end

        user:display(message, true)
    else
        user:display("failed to spawn "..typeOfTarget, false)
    end
end




