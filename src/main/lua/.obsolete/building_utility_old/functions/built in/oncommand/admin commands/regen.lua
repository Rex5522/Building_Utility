if command == "?regen" then
    if false then
    if g_savedata["server"]["regen"] then
        g_savedata["server"]["regen"]=false
        server.notify(user_id, sname, "regen off", 7)
    else
        g_savedata["server"]["regen"]=true
        server.notify(user_id, sname, "regen on", 7)
    end
    end
end