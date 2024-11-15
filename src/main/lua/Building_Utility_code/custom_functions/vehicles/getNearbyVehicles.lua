--- Gets vehicles within a specified distance from a target location.
--- @param targetLocaion table -- The matrix of the target location to measure distance from.
--- @param vehicles table -- A ORDERED table containing vehicle IDs, where each entry is a vehicle ID.
--- @param maxDistance integer -- The maximum distance to include vehicles in the result.
--- @return table -- A table of vehicles within the specified distance, each entry containing distance, matrix, and vehicle ID.
function getNearbyVehicles(targetLocaion, vehicles, maxDistance)
    local nearbyVehicles = {}

    for index, vehicleID in ipairs(vehicles) do
        vehicleMatrix, success = server.getVehiclePos(vehicleID)
        if success then
            dist = matrix.distance(targetLocaion, vehicleMatrix)
            if dist < maxDistance then
                table.insert(nearbyVehicles, {
                    distanceFromMainBody = dist,
                    matrix = vehicleMatrix,
                    vehicleID = vehicleID
                })
            end
        else
            BU_Debug("failed to get vehicle pos")
        end
    end

    return nearbyVehicles
end