if command=="?spawn" then
    two=tonumber(two)
    if two==nil then two=0 end
    if two>=0 and two<=99999999999 then	
        for i=1,3 do
            if g_savedata["playerdata"][steam_id]["vehicles"][i]["id"]==0 then
                server.notify(user_id, "server: message", "spawning vehicle", 7)
                rix=gps(two, two, true, user_id)
                vehicle_id, is_success3 = server.spawnVehicle(rix, one)
                if is_success then server.notify(user_id, "server: message", "worked", 7) end
                is_success = server.setVehicleEditable(vehicle_id, false)
                is_success = server.setVehicleTooltip(vehicle_id, "rex")
                g_savedata["playerdata"][steam_id]["vehicles"][i]={["id"]=vehicle_id, ["name"]=one}
                g_savedata["vehicles"][vehicle_id]={["steam_id"]=steam_id, ["index"]=i, ["name"]=one}				
                if g_savedata["playerdata"][steam_id]["au_seat"] then
                    g_savedata["iswait"][vehicle_id]={["object_id"]=object_id,["spawnlc"]=false}
                end
                break
            end
            if i==3 then
                server.notify(user_id, "server: message", "sorry but you have reached your vehicle limit."..
                " use ?dsa to despawn all spawned vehicles you own.", 6)
            end
        end
    else
        server.notify(user_id, "command", "arg:2 needs to be a number between 0/99999999999", 6)
    end
end