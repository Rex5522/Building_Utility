--- despawns a players newest vehicle
-- @param data
-- @return nil
function CMD_Qmqm(data)
    local user = data.user

    if #user.vehicles <= 0 then
        user:display("no vehicles to despawn", false)
        return
    end

    local groupID = user.vehicles[#user.vehicles]

    if user.autoBench then
        local vehicle = getVehicleFromGroupID(groupID)
        if vehicle.userLocationDuringSpawn ~= matrix.identity() then
            user:teleport(vehicle.userLocationDuringSpawn)
        else
            user:display("autoBench error: this vehicle seems to have been made before autoBench was added")
        end
    end

    local success = server.despawnVehicleGroup(groupID, true)

    if success then
        user:display("vehicle "..groupID.." despawned", true)
    else
        user:handleNilVehicles()
        user:display("failed to despawn " .. groupID .. ". this vehicle will be removed from your list", false)
    end
end