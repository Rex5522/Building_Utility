if command=="?tsunami"then
    if g_savedata["server"]["autoprotect"] then
        server.notify(user_id, sname..error, "error: auto_protect is active. disable using ?protect", 6)
    else
        rix = gps(one, 0, true, user_id)
        if rix=="error" or false then
            server.notify(user_id, "command-error", "error: i cant find your gps cordnets", 6)
        else
            is_success = server.spawnTsunami(rix, two)
        end
    end
end