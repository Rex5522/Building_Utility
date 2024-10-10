if command == "??" or command == "?/" or command == "?c" then
    high=0
    num=1
    for index,inner in pairs(pd["vehicles"]) do
        if high<inner.id then
            debug(inner.id)
            high=inner.id
        end
        num=num+1
    end
    
    if high>0 then
        if server.despawnVehicleGroup(high, true) then
            display(user_id, "vehicle with an id of "..high.." despawned", 3)
        else
            display(user_id, "unable to despawn vehicle", 2)
            return
        end
    else
        display(user_id, "no vehicles to despawn", 2)
        return
    end
    if pd["autoback"] then
        is_success = server.setPlayerPos(user_id, pd["lc"]["autoback"])
    end
end