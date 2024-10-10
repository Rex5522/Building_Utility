if command=="?die" then
    hp=0
    if one~=nil then
        if tonumber(one)~=nil then
            if server.getObjectData(object_id)["hp"]>tonumber(one) then hp=tonumber(one) end
        else
            server.notify(user_id, sname..error, "arg:1 was not a number", 7)
        end
    else
        if math.random(1,1000)==1 then
            rix=gps(0, 0, false, user_id)
            if rix~="error" and g_savedata["server"]["dlc_weapons"] then
                server.spawnExplosion(rix, 0.05)
            end
        end
    end
    server.setCharacterData(object_id, hp, true, false)
end