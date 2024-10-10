if command=="?pvp" then
    if true then display(user_id, "command not ready", 2) return end
    if g_savedata["playerdata"][steam_id]["pvp"] then
        g_savedata["playerdata"][steam_id]["pvp"]=false
        server.notify(user_id, "command", "pvp is now disabled", 7)
    else
        g_savedata["playerdata"][steam_id]["pvp"]=true
        server.notify(user_id, "command", "pvp is now enabled", 7)
    end
end