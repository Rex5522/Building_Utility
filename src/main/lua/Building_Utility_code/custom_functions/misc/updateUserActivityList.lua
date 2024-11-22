--- returns a list of active user objects userID | userObject
-- @return table
function updateUserActivityList()
    if G_userActivityList.lastUpdated == G_Tick then
        BU_Debug("already updated player activity list this tick")
        return false
    end

    local playerList = server.getPlayers()
    local activeSteamIds = {}
    for _, playerData in pairs(playerList) do
        activeSteamIds[tostring(playerData.steam_id)] = true
    end

    G_userActivityList = {
        lastUpdated = G_Tick,
        active = {},
        notActive = {}
    }

    for steamID, user in pairs(G_Users) do
        if activeSteamIds[steamID] then
            G_userActivityList.active[user.ID] = user
            user.playerGoneForXTicks = 0
        else
            G_userActivityList.notActive[user.ID] = user
            user.playerGoneForXTicks = user.playerGoneForXTicks + 1
        end
    end

    return true
end