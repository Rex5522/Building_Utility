---teleports vehicles to a location while keeping there rotation reletive to eachother
---@param targetLocation table
---@param vehiclesToTeleport table
---@param nearbyOnly boolean|nil
---@param safe boolean|nil
---@param teleportSeatedCreatures boolean|nil
---@return integer
function teleportVehicles(targetLocation, vehiclesToTeleport, nearbyOnly, safe, teleportSeatedCreatures, alignToTarget)
    if not targetLocation or not vehiclesToTeleport then
        BU_Debug("NOT ENOUGH ARGS")
        return -1
    end

    local success
    teleportSeatedCreatures = teleportSeatedCreatures or true
    nearbyOnly = nearbyOnly or true

    targetLocation = moveMatrix(targetLocation, 0, 5, 0)
    if not alignToTarget then
        targetLocation = resetMatrixRotation(targetLocation)
    end

    if safe then
        local safeValue = findSafeLocation(targetLocation, 70, 20)
        if type(safeValue) == "table" then
            targetLocation = safeValue
        else
            return 1
        end
    end

    if teleportSeatedCreatures then
        BU_Debug("teleporting seated creatures")
        local seats = getSeatedCreatures(vehiclesToTeleport)
        local vehicle
        local vehicleID
        local targetTable

        for index, seat in pairs(seats.seated) do -- yeet seat data to the vehicle object and let on load take care of it
            vehicleID = seat.vehicleID
            vehicle = getVehicleFromVehicleID(vehicleID)

            if vehicle then
                targetTable = vehicle.teleportUsersToSeat
                if not targetTable[vehicleID] then
                    targetTable[vehicleID] = {}
                end
                table.insert(targetTable[vehicleID], seat)

                local success = server.setObjectPos(seat.seated_id, targetLocation)

                local user = getUserFromUserID(seat.seated_peer_id)
                if user then
                    user:display("you are being teleported with the vehicle")
                end
            else
                BU_Debug("a vehicle didint exist")
            end
        end
    end

    local mainVehicleMatrix = server.getVehiclePos(vehiclesToTeleport[1])
    if nearbyOnly then
        BU_Debug("nearby only")
        vehiclesToTeleport = getNearbyVehicles(mainVehicleMatrix, vehiclesToTeleport, 150)
    else
        vehiclesToTeleport = getVehicleLocationsFromGroup(vehiclesToTeleport)
    end

    local calculatedVehicleMatrices = calculateVehicleRelativeMove(targetLocation, orderTable(vehiclesToTeleport, "matrix"))

    for index, vehicleData in pairs(vehiclesToTeleport) do
        if calculatedVehicleMatrices[index] then
            success = server.setVehiclePos(vehicleData.vehicleID, calculatedVehicleMatrices[index].matrix)
        else
            BU_Debug("WARNING: a pos index was nil")
        end

        if not success then
            BU_Debug("failed to move vehicle: "..tostring(vehicleData.vehicleID))
        end
    end

    return 0
end