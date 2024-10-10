if command=="?noc4" then
    if g_savedata["server"]["noc4"] then
        g_savedata["server"]["noc4"]=false
        server.notify(user_id, "server-admin", "c4 has been enabled", 7)
    else
        g_savedata["server"]["noc4"]=true
        server.notify(user_id, "server-admin", "c4 has been disabled", 7)
    end
end