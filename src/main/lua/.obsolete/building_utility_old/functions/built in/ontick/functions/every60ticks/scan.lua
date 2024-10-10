if sd1["scanners"]~=nil then
    --debug(1)
    if sd1["scanners"]["amount"] ~= nil then
        sc = sd1["scanners"]
        -- debug(sc["amount"])
        -- debug(23)
        -- debug(sc["per"])
        if sd1["scanners"]["amount"] > 0 then 
            for i=1,clamp(sd1["scanners"]["amount"],1,sd1["scanners"]["per"]) do
                x,y,z = matrix.position(sd1["scanners"]["rix"])
                x1 = random(x-sd1["scanners"]["area"],x+sd1["scanners"]["area"])
                y1 = clamp(y,0,99999)+sc["h-offset"]
                z1 = random(z-sd1["scanners"]["area"],z+sd1["scanners"]["area"])
                rix2 = matrix.translation(x1,y1,z1)
                vehicle_id, is_success, group_vehicles = server.spawnVehicle(rix2, "BU_SCANNER")
                if sd1["scanners"]["active"]==nil then sd1["scanners"]["active"]={} end
                if is_success then
                    sd1["scanners"]["active"][vehicle_id]=vehicle_id
                    debug(vehicle_id)
                    delay("remove-scanner",vehicle_id,nil,nil,sd1["scanners"]["lifetime"]*60)
                end
                
            end
            sd1["scanners"]["amount"] = sd1["scanners"]["amount"] - sd1["scanners"]["per"]
        end
    end
end