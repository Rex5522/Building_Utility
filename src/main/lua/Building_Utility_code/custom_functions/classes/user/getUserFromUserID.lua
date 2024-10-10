--- gets a user from an id
-- @param userID any, the userID
-- @return a user object or nil
function getUserFromUserID(userID)
    local user = g_savedata.users[g_savedata.steamIDs[tonumber(userID)]] or nil
    -- if not user then
    --     BU_Debug("user does not exist: "..tostring(userID), g_savedata.users, g_savedata.steamIDs)
    -- end

    return user
end