-- make sure user is admin or owns the vehicle
if command == "?repair" or command == "?rep" then

    if one~=nil then

        if sv1[ton(one)] ~= nil then
            debug("group_id detected")
            for index,inner in pairs(sv1[ton(one)]["live"]) do
                if inner then
                    for index2,inner2 in pairs(server.getVehicleComponents(index)["components"]) do
                        for index3,inner3 in pairs(inner2) do
                            x = inner3["pos"]["x"]
                            y = inner3["pos"]["y"]
                            z = inner3["pos"]["z"]

                            is_success = server.addDamage(index, -999, x,y,z, 999)
                            debug("repaired i-id "..index)
                        end


                    end
                end
            end
        else
            is_success = server.addDamage(ton(one), -999999999, 0, 0, 0, 99999999)
            debug("repaired i-id "..one)
        end
        debug(is_success)
    else
        
    end
end