if command=="?autoauth" then
    if g_savedata["server"]["autoauth"] then
        g_savedata["server"]["autoauth"]=false
        server.notify(user_id, "server-admin", "auto_auth disabled", 7)
    else
        g_savedata["server"]["autoauth"]=true
        server.notify(user_id, "server-admin", "auto_auth enabled", 7)
        PLAYER_LIST = server.getPlayers()
        for index, inner in pairs(PLAYER_LIST) do
            num=tonumber(index)
            if not PLAYER_LIST[num]["admin"] 
            and not PLAYER_LIST[num]["auth"] 
            and not who(PLAYER_LIST[num]["steam_id"],7,"s") 
            and PLAYER_LIST[num]["steam_id"]~=nil then
                server.addAuth(who(PLAYER_LIST[num]["steam_id"],2,"s"))
            end
    
        end	
    end
end