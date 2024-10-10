if command=="?protect" then
    value=g_savedata["server"]["autoprotect"]
    if value then 
        g_savedata["server"]["autoprotect"]=false 
        server.notify(user_id, sname, "auto_protect is now inactive", 7)
    else 
        g_savedata["server"]["autoprotect"]=true 
        server.notify(user_id, sname, "auto_protect is now active", 7)
    end
end