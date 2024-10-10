--- gets a user from an id
-- @param userID any, the userID
-- @return a user object or nil
function getUserFromSteamID(steamID)
    local user = g_savedata.users[tostring(steamID)] or nil
    if not user then
        BU_Debug("user does not exist: "..tostring(steamID))
    end

    return user
end