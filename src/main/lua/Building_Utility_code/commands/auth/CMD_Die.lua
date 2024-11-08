function CMD_Die(data)
    local user = data.user

    objectID, success = user:getObjectID()
    if not success then
        user:display("hmmm... you seem to not exist somehow", false)
        return
    end

    server.setCharacterData(objectID, 0, nil, nil)
end