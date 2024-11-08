function CMD_Kill(data)
    local user = data.user
    local targetUser = getUserFromUserID(data.arg1)

    if not targetUser then
        user:display("target user not found. id: "..data.arg1, false)
        return
    end

    objectID, success = targetUser:getObjectID()
    if not success then
        user:display("player found but was unable to kill user")
        return
    end
    
    server.setCharacterData(objectID, 0, nil, nil)
    targetUser:display("a admin has revoked your living privileges")
end