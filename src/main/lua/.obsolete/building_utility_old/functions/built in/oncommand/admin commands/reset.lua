if command=="?!RESET!" then
    if true then return end
    reset=true
    PLAYER_LIST = server.getPlayers()
    if g_savedata~=nil then
        for index, inner in pairs(g_savedata["vehicles"]) do
            server.despawnVehicleGroup(tonumber(index), true)
        end
    end

    display(-1, "resetting all player and server files", 1)

    pd = nil
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
        g_savedata["playerdata"][steam_id]=nil
        onPlayerJoin(steam_id, name, user_id, admin, auth)
    end
    server.announce(sname, "please remember to use ?reload_scripts", user_id)
    reset=false
end