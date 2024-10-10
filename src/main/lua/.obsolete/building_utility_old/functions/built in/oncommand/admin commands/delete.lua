if command=="?delete" then
    PLAYER_LIST = server.getPlayers()
    g_savedata["playerdata"][PLAYER_LIST[tonumber(one)]["steam_id"]]=nil
    if g_savedata["playerdata"][PLAYER_LIST[tonumber(one)]["steam_id"]]==nil then
        server.notify(user_id, "dev-command", "player file for:"..PLAYER_LIST[tonumber(one+1)]["name"].." deleted", 7)
    else
        server.notify(user_id, "error", "unable to delete player file", 6)
    end
end