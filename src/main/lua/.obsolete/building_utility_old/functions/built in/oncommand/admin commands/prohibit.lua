if command=="?prohibit" then -- removes auth but doesint kick for some reason?
    one=tonumber(one)
    two=tonumber(two)
    if one~=nil and one>=1 then	 
        if two~=nil and two>=0 then
            steam_id2=who(one)
            server.notify(user_id, "server-admin", "steam_id: "..steam_id2.."\nban time: "..two.."(min)\nuser_id: "..one, 7)
            g_savedata["bantime"][steam_id2]=two*60
            PLAYER_LIST = server.getPlayers()
            for index, inner in pairs(PLAYER_LIST) do
                num=tonumber(index)
                if PLAYER_LIST[num]["id"]==one then
                    if PLAYER_LIST[num]["admin"] then
                        server.removeAdmin(one)
                        break
                    elseif PLAYER_LIST[num]["auth"] then
                        server.removeAuth(one)
                        break
                    end
                end
            end
            g_savedata["playerdata"][steam_id2]["ban"]=true
            g_savedata["playerdata"][steam_id2]["banned"]=true
            delay("kick",one,nil,nil)
        else
            server.notify(user_id, "command-error", "arg:2 needs to be a number non-negetive number (1 = 1m)", 6)
        end
    elseif one==nil then
        server.notify(user_id, cmdf, "?prohibit user_id bantime(min)", 7)
    elseif one>-1 and one<1 then
        server.notify(user_id, "command-error", "you cannot kick the host", 6)
    end
end