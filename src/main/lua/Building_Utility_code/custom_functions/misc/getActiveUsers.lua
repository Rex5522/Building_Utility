--- returns a list of active user objects userID | userObject
-- @return table
function getActiveUsers()
    local playerList = server.getPlayers()
    local activeUserList = {}

    for index, userData in pairs(playerList) do
        local user = getUserFromUserID(userData.id)
        -- if not user then
        --     BU_Debug("a player was nil", userData)
        -- end

        if user then
            activeUserList[user.ID] = user
        end

    end

    return activeUserList
end