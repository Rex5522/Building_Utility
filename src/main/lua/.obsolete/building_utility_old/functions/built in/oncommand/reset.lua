if command=="?!RESET!" and admin then
    reset=true
    PLAYER_LIST = server.getPlayers()
    if g_savedata["vehicles"]~=nil then
        for index, inner in pairs(g_savedata["vehicles"]) do
            server.despawnVehicleGroup(tonumber(index), true)
        end
    end

    server.notify(-1, sname, "resetting all player and server files", 7)
    onCreate(true)

    for index, inner in pairs(PLAYER_LIST) do
        user_id=tonumber(index)
        for index, inner in pairs(PLAYER_LIST[tonumber(index)]) do
            index2=tostring(index)
            inner2=tostring(inner)
            if index2=="steam_id" then steam_id=tostring(inner)
            elseif index2=="id" then user_id=tonumber(inner)
            elseif index2=="name" then name=tostring(inner)
            elseif index2=="admin" then admin=inner
            elseif index2=="auth" then auth=inner
            end
        end
        
        onPlayerJoin(steam_id, name, user_id, admin, auth)
    end
    server.announce(sname, "please remember to use ?reload_scripts",-1)
    reset=false
else
    steam_id=who(user_id)
    steam_id2=nil
    object_id=who(user_id, 5)
    object_id2=nil
    rix=nil
    pd=g_savedata["playerdata"][steam_id]
    sv=g_savedata["server"]
    debug("steam_id: "..tostring(steam_id).."\nuser_id: "..tostring(user_id).."\nobject_id: "..tostring(object_id).."\nfull command: "..tostring(full))
end