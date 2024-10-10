if command=="?dsa" then
    for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
        vehicle_id=g_savedata["playerdata"][steam_id]["vehicles"][tonumber(index)]["id"]
        if vehicle_id~=0 then
            if server.despawnVehicleGroup(vehicle_id, true) then
                server.notify(user_id, sname, "vehicle "..vehicle_id.." despawned", 7)
            else
                server.notify(user_id, sname, "found a vehicle of your's but was unable to despawn it", 7)
            end
        end
    end
end