if command=="?antisteal" then
    g_savedata["playerdata"][steam_id]["antisteal"]=toggle(g_savedata["playerdata"][steam_id]["antisteal"])
    if g_savedata["playerdata"][steam_id]["antisteal"] then
        server.notify(user_id, "server", "antisteal enabled. your vehicles are now protected", 9)
        for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
            for index,inner in pairs(server.getVehicleGroup(inner.id)) do
                server.setVehicleEditable(inner, false)
            end
        end
    else
        server.notify(user_id, "server", "antisteal disabled. your vehicles are no longer protected", 6)
        for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
            for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
                for index,inner in pairs(server.getVehicleGroup(inner.id)) do
                    server.setVehicleEditable(inner, true)
                end
            end
        end
    end
end