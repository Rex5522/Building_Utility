--- gets data for a user from the game
-- @param userID any,
-- @return userData table,
function userClass:getDefaultUserData(userID)
    local playerList = server.getPlayers()
    for index, userData in pairs(playerList) do
        if userData.id == userID then
            return userData
        end
    end
end