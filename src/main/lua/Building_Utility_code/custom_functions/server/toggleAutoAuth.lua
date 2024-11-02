--- used to toggle auto auth. when toggled on it will auth all eligible users that are not authed
-- @return nil
function toggleAutoAuth() 
    G_ServerSettings.autoAuth = not G_ServerSettings.autoAuth
    if not G_ServerSettings.autoAuth then
        return
    end

    for index, userData in pairs(server.getPlayers()) do
        local user = getUserFromUserID(userData.id)
        if user then
            local canBeAutoAuthed = (user.bans == 0 and not userData.auth)
            if canBeAutoAuthed then
                server.addAuth(user.ID)
            end
        end
    end
end