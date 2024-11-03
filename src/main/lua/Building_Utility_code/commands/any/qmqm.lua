--- despawns a players newest vehicle
-- @param data
-- @return nil
function CMDqmqm(data)
    local user = data.user

    if #user.vehicles <= 0 then
        user:display("no vehicles to despawn", false)
        return
    end

    local groupID = user.vehicles[#user.vehicles]
    local success = server.despawnVehicleGroup(groupID, true)

    if success then
        user.vehicles[groupID] = nil
        user:display("vehicle "..groupID.." despawned", true)
    else
        user:display("failed to despawn "..groupID, false)
    end
end