---comment
---@param user any
---@param admin any
---@param arg1Data any
---@param arg2Data any
---@return integer|table 1/2/3/4 | teleportBlocking/failedToGetLocation
function tp_getLocation(user, admin, arg1Data, arg2Data)

    local success
    local targetLocation
    local targetVehicleGroup
    local targetUser
    local vehicleSeats
    local seatData

    if arg2Data then
        locationArg = arg2Data
    else
        locationArg = arg1Data
    end

    if locationArg[2] == "p" or locationArg[2] == "u" then

        targetUser = locationArg[1]
        if user.ID ~= targetUser.ID and targetUser.teleportBlocking and not admin then
            return 1
        end
        targetLocation = targetUser:getLocation(1, 1)

    elseif locationArg[2] == "g" then

        targetVehicleGroup = locationArg[1]
        targetUser = getUserFromUserID(targetVehicleGroup.ownerID)
        if not tp_canTeleportToTarget(user, admin, targetUser) then
            return 1
        end

        -- if player then attempt to get seat
        if arg1Data[2] == "u" or arg1Data[2] == "p" or not arg2Data then
            vehicleSeats = getGroupSeatedCreatures(locationArg[4])
            if vehicleSeats.notSeated[1] then
                targetLocation = vehicleSeats.notSeated[1]
                BU_Debug("seat found")
            else
                BU_Debug("seat not found")
            end
        end

        if not targetLocation then
            targetLocation, success = server.getVehiclePos(targetVehicleGroup.mainBodyID)
            if not success then
                return 2
            end
        end

    elseif locationArg[2] == "v" then

        targetVehicle = locationArg[1]
        targetUser = getUserFromUserID(targetVehicle.ownerID)

        if not tp_canTeleportToTarget(user, admin, targetUser) then
            return 1
        end

        -- if player then attempt to get seat
        if arg1Data[2] == "u" or arg1Data[2] == "p" or not arg2Data then
            vehicleSeats = getVehicleSeatedCreatures(locationArg[4])
            if vehicleSeats.notSeated[1] then
                targetLocation = vehicleSeats.notSeated[1]
            end
        end

        if not targetLocation then
            targetLocation, success = server.getVehiclePos(getVehicleFromGroupID(targetVehicle.groupID).mainBodyID)
            if not success then
                return 2
            end
        end

    elseif locationArg[2] == "s" then

        seatData = locationArg[1]
        vehicleData = vehicleExist(seatData.vehicleID)
        targetUser = getUserFromUserID(vehicleData.ownerID)
        if not targetUser then
            return 2
        end

        if not tp_canTeleportToTarget(user, admin, targetUser) then
            return 1
        end

        targetLocation = locationArg[1]
    elseif locationArg[2] == "l" then
        targetLocation = locationArg[1]
    end

    if not targetLocation then
        BU_Debug("ERROR: target location nil")
        return 2
    end

    return targetLocation
end