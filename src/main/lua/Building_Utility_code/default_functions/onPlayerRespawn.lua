function onPlayerRespawn(userID)
    local user = getUserFromUserID(userID)

    user:setInventory(user.inventorys.default)
end