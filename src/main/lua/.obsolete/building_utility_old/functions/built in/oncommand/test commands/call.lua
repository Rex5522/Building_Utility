-- this function is used to comunictae with a vehicle through the script. (allows vehicles to know where the player is and that the player is the player)

if command=="?call" then
    
    if invscanner(user_id,19)==nil then return end

    for index,inner in pairs(pd["vehicles"]) do
        DATA, is_success = server.getVehicleSign(inner.id, one)
        if is_success then debug("indeed") end
    end

end