if command=="?despawn" or command=="?d" then
    debug("despawn command")
    if string.sub(one,1,1)=="i" then ind=true else ind=false end
    one=ton(one)
    if g_savedata["vehicles"][one]==nil then 
        addonv=true
    else 
        addonv=false
        steam_id2=g_savedata["vehicles"][one]["steam_id"]
        if who(user_id)==g_savedata["vehicles"][one]["steam_id"] then
            owned=true
        else
            owned=false
        end
    end

    if admin or owned then
        is_success=false
        if ind then
            is_success = server.despawnVehicle(one, true)
        else
            is_success = server.despawnVehicleGroup(one, true)
        end	
        if is_success then
            if addonv then owner="addon" else owner=who(steam_id2,1,"s") end
            if not owned then
                server.notify(user_id, "server-admin", 
                "despawned "..owner.."'s vehicle\nvehicle\nid: "..one, 7)
                if not addonv then
                    server.notify(who(steam_id2,2,"s"), "server: message", "your vehicle was despawned by "..who(user_id,1), 7)
                end
            else
                server.notify(user_id, "server-command", "vehicle with id of "..one.." despawned", 7)
            end
        else
            server.notify(user_id, "command-error", "an error occured. maybe check vehicle_id?", 6)
        end
    else
    server.notify(user_id, "comand-format", 
    "?despawn vehicle_id\nto get the vehicle_id type \n?list and look for the vehicle you want to despawn", 7)
    end
end