if command == "?repair" or command == "?rep" then
-- make sure user is admin or owns the vehicle
-- maybe add vnear function?

    if one~=nil then
        if sv1[ton(one)] ~= nil then
            debug("group_id detected")
            for index,inner in pairs(sv1[ton(one)]["live"]) do
                debug(index)
                is_success = server.resetVehicleState(index)
            end
        end

        if is_success then
            display(user_id, "vehicle repaired", 3)
        else
            display(user_id, "vehicle failed to repair", 2)
        end

    end

end