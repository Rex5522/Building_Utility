if delayed~=nil then
    if delayed[game_ticks2]~=nil then
        if delayed[game_ticks2]["action"]~=nil then

            local one = delayed[game_ticks2][1]
            local two = delayed[game_ticks2][2]
            local three = delayed[game_ticks2][3]

            if delayed[game_ticks2]["action"]=="kick" then

                debug("kicking player")
                server.kickPlayer(delayed[game_ticks2]["one"])

            elseif delayed[game_ticks2]["action"]=="removeerrinfo" then 

                g_savedata["adminpanel"][one]["errorinfo"]="" 

            elseif delayed[game_ticks2]["action"]=="removerq" then

                debug("removing a request")
                g_savedata["server"]["requests"][one][two]=nil

            elseif delayed[game_ticks2]["action"]=="removemapid" then

                server.removeMapID(one, two)

            elseif delayed[game_ticks2]["action"]=="ping" then

                server.spawnExplosion(one, two)

            elseif delayed[game_ticks2]["action"]=="remove-scanner" then

                    debug("despawning: "..one)
                    local rix, is_success = server.getVehiclePos(one)
                    if not is_success then debug("RETURNED1") return end
                    local LOADED_VEHICLE_DATA, is_success = server.getVehicleComponents(one)
                    if not is_success then debug("RETURNED2") return end
                    debug("delayed")
                    for index,inner in pairs(LOADED_VEHICLE_DATA["components"]["dials"]) do
                        if inner["name"] == "BU-SCANNER" then
                            sd1["scanned"][one]={["v"]=inner["value"],["rix"]=rix}
                        end
                    end
                    server.despawnVehicle(one, true)
                    debug("despawned")
                --sd1["scanners"]["active"][one]=nil
            elseif delayed[game_ticks2]["action"]=="test" then

                display(one,"pong",3)

            end
        end
        delayed[game_ticks2]=nil
    end
end