--- creates a user from userID
-- @param userID any,
-- @return user or nil
function userClass:createUserWithUserID(userID)
    if not userID then
        BU_Debug("userID was nil")
        return nil
    end
    
    local defaultData = userClass:getDefaultUserData(userID)
    local user = userClass:createUser(defaultData.steam_id, defaultData.name, userID)
    return user
end