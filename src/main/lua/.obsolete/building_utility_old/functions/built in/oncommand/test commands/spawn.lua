if command == "?spawn" then

    if g_savedata["playerdata"][steam_id]["lc"]["spawnlc"] == nil then
        display(user_id, "please set your spawn lc using \n?save spawnlc", 1)
        return
    end

    vehicle_id, is_success, group_vehicles = server.spawnVehicle(g_savedata["playerdata"][steam_id]["lc"]["spawnlc"], one)
    if is_success then
        display(user_id, "spawning your vehicle at your spawnlc", 3)
        g_savedata["server"]["v-bypass"][server.getVehicleData(vehicle_id)["group_id"]] = {
            ["id"] = user_id
        }
    else
        display(user_id, "unable to spawn vehicle for a unkown reason", 2)
    end

end