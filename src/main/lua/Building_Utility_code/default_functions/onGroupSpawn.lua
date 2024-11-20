function onGroupSpawn(groupID, ownerID, x, y, z, cost)
    local groupVehicles = handleVehicleSpawn(groupID, ownerID)

    if ownerID == -1 then
        if not groupVehicles then
            return
        end

        for _, vehicleID in ipairs(groupVehicles) do
            local toolTip = string.format(
                "owner: %s\ngroupID: %d\nvehicleID: %d",
                "script", groupID, vehicleID
            )
            server.setVehicleTooltip(vehicleID, toolTip)
        end
        return
    end

    local owner = getUserFromUserID(ownerID)
    if not owner then
        BU_Debug("a null player just spawned a vehicle?!?!?!")
        return
    end

    -- check vehicle limit
    if #owner.vehicles < g_savedata.serverSettings.vehicleLimit or owner:getStatus() == 2 then
        table.insert(owner.vehicles, groupID)
    else
        display("vehicle limit reached. please delete a vehicle first", ownerID, 6)
        server.despawnVehicleGroup(groupID, true)
        return
    end

    if not groupVehicles then
        BU_Debug("groupVehicles was nil")
        return
    end

    local vehicle = vehicleClass:createVehicle(groupID, ownerID, cost, owner.antiSteal, groupVehicles)
    for index, vehicleID in pairs(groupVehicles) do
        local vehicleData, success = server.getVehicleData(vehicleID)
        local toolTip = string.format(
            "owner: %s\ngroupID: %d\nvehicleID: %d\ncreate by:",
            owner.name, groupID, vehicleID
        )

        if index == 1 then
            mainToolTip = toolTip
        end

        if success and #vehicleData.authors > 0 then
            vehicle.workshopVehicle = true

            for _, autherData in pairs(vehicleData.authors) do
                toolTip = toolTip.."\n "..autherData.name
                if owner.steamID == tostring(autherData.steam_id) then
                    vehicle.isOwnerOfWorkshopVehicle = true
                end
            end
        end

        server.setVehicleEditable(vehicleID, not owner.antiSteal)
        server.setVehicleTooltip(vehicleID, toolTip)
    end

    if vehicle.workshopVehicle and not vehicle.isOwnerOfWorkshopVehicle and not G_ServerSettings.workshopAllowed and (owner:getStatus() ~= 2) then
        owner:display("you spawned a workshop vehicle that you do not own. no workshop vehicles are allowed on this server", false)
        server.despawnVehicleGroup(groupID, true)
        return
    end

    if owner.spawnlc then
        local targetLocation = owner.savedLocations.locations[owner.spawnlcTargetLocation]
        if targetLocation then
            teleportVehicles(targetLocation.matrix, groupVehicles)
            owner:teleport(targetLocation.matrix)
            owner:display("vehicle teleported to spawnlc", true)
        else
            owner:display("no valid spawnlc selected. vehicle not teleported. type ?spawnlc help for more information", false)
        end
    end

    vehicle.userLocationDuringSpawn = owner:getLocation()

    server.addMapObject(-1, groupID + 7000, 1, 1, 0, 0, 0, 0, vehicle.mainBodyID, nil,
    owner.name.."'s vehicle", 0, mainToolTip, 100, 100, 100, 255)

    if vehicle.totalBodys > 100 and owner.autoSeat then
        owner:display("your vehicle has to many sub bodys ("..tostring(vehicle.totalBodys).."). autoSeat disabled for this vehicle", false)
    end
end