if command == "?test" then
    if one == "1" then
        g_savedata["perma"]={}
        -- sd1["scanned"]={}
        -- sd1["mines"]={}
    end
    if one == "2" then
        server.removeMapID(user_id, 017)
        x,y,z = matrix.position(gps(0,0,false,user_id))
        server.addMapLabel(-1, 32876, 2, "mine", x, z, 255, 255, 255, 255)
    end
    if one == "3" then
        is_success = server.moveGroup(two, gps(0,0,false,user_id))
    end
    if one == "4" then
        for i=1,500 do
            rix=gps(0,0,false,user_id)
            s_success = server.spawnMeteor(rix, 999, false)
        end
    end
    if one == "5" then
        two=tonumber(two)
        sv["regen"]=100/(two*60)
        debug(100/(two*60))
    end
    if one == "6" then
        g_savedata["server"]["mines"]={}
    end
    if one == "7" then

    end
    if one == "8" then

    end
    if one == "9" then

    end
    if one == "nearv" then -- this is a test for a feature, do not remove -- gets vehicle ids within a set distance
        txt = ""
        user_pos, is_success = server.getPlayerPos(user_id)
    
        for i=1,100000 do
            vehicle_pos, is_success = server.getVehiclePos(i)
    
            if not is_success then break end
                
            if matrix.distance(vehicle_pos, user_pos) < tonumber(one) then
                txt = txt..tostring(i).."\n"
            end
    
        end
    
        display(user_id,"nearby vehicles: "..txt,3)
    
    
    end
    if one == "alp" then
        svlog("alp","testing your mother on a sunday afternune")
    end
    if one == "test" then
        debug("1111")
    end
    if one == "" then

    end
    if one == "" then

    end
    if one == "" then

    end
    if one == "" then

    end
    if one == "" then

    end
end