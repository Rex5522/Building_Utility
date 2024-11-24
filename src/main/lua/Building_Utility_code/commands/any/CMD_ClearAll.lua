function CMD_ClearAll(data)
    local user = data.user

    if #user.vehicles <= 0 then
        user:display("no vehicles to despawn", false)
        return
    end

    local failCount = 0
    local despawnCount = 0

    for i = #user.vehicles, 1, -1 do
        local groupID = user.vehicles[i]
        local success = server.despawnVehicleGroup(groupID, true)
        if not success then
            failCount = failCount + 1
            BU_Debug("WARNING: a user vehicle failed to despawn groupID " .. tostring(groupID))
        else
            despawnCount = despawnCount + 1
        end
    end

    if failCount > 0 then
        user:display("failed to despawn " .. tostring(failCount) .. " vehicle(s). these vehicles will be removed from your list if they fail to validate", false)
        user:handleNilVehicles()
    else
        user:display("despawned " .. tostring(despawnCount) .. " vehicles", true)
    end
end