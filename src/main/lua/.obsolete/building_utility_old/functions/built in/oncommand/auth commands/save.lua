if command=="?save" then
    if one~=nil then
        if one=="inv" then
            if two~=nil then
                saveinv(user_id, two)
                server.notify(user_id, "server-command", "saving loudout as: "..two, 7)
            else
                server.notify(user_id, "command-format", "?save inv/lc/spawnlc name", 7)
            end
        elseif one=="lc" then
            if tonumber(two)==nil and tonumber(string.sub(two, 2,-1))==nil then
                if two~=nil then
                    if g_savedata["playerdata"][steam_id]["lc"][two]~=nil then
                        server.notify(user_id, "server-command", "overiding save: "..two, 7)
                    else
                        server.notify(user_id, "server-command", "saving current location as: "..two, 7)
                    end
                    g_savedata["playerdata"][steam_id]["lc"][two]=gps(0, 5, true, user_id)
                else
                    server.notify(user_id, "command-format", "?save inv/lc/spawnlc name", 7)
                end
            else
                server.notify(user_id, "server-command", "cannot save a location as just numbers or a single letter then numbers as that would interfere with some commands", 7)
            end
        elseif one=="spawnlc" then
            g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]=gps(0, 5, true, user_id)
            server.notify(user_id, "server-command", "saving current location as: spawnlc", 7)
        elseif one=="seat" then
            data=g_savedata["playerdata"][steam_id]
            if tonumber(two)==nil and tonumber(string.sub(two, 2,-1))==nil then
                vehicle_id, is_success = server.getCharacterVehicle(object_id)
                if is_success then
                    seater=seated(vehicle_id,true)
                    worked=false
                    for a,b in pairs(seater) do 
                        if ton(a)==ton(object_id) then
                            worked=false
                            seater=seated(vehicle_id,true)
                            for a2,b2 in pairs(seater) do
                                if a2==object_id then
                                    tab={
                                        ["vehicle_id"]=vehicle_id,["x"]=b2.x,["y"]=b2.y,["z"]=b2.z
                                    }
                                    worked=true
                                    break
                                end
                            end
                            
                            if data["lc"][two]~=nil and worked then
                                data["lc"][two]=nil
                                server.notify(user_id, "server-command", "overriding your lc with your seat: "..two, 7)
                            elseif data["seats"][two]~=nil and worked then
                                server.notify(user_id, "server-command", "overriding your seat: "..two, 7)
                            elseif worked then
                                server.notify(user_id, "server-command", "saving your seat as "..two, 7)
                            end
                            if worked then data["seats"][two]=tab end
                            break
                        end
                    end
                    if not worked then server.notify(user_id, "server-command", "unable to find the seat your in", 7) end
                else
                    server.notify(user_id, "server-command", "cannot save a seat while not in a seat", 7)
                end
            else
                server.notify(user_id, "server-command", "cannot save a location as just numbers or a single letter then numbers as that would interfere with some commands", 7)
            end
        else
            server.notify(user_id, "command-format", "?save inv/lc/spawnlc name_of_said_thing", 7)
        end
    else
        server.notify(user_id, "command-format", "?save inv/lc/spawnlc name_of_said_thing", 7)
    end
end