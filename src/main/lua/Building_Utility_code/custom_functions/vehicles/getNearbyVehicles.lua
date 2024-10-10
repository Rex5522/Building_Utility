---gets vehicles within a distance from a list of vehicles
---@param targetLocaion table
---@param vehicles table, {[1] = vehicleID}
---@param maxDistance integer
---@return table
function getNearbyVehicles(targetLocaion, vehicles, maxDistance)
    local nearbyVehicles = {}

    for index, vehicleID in ipairs(vehicles) do
        vehicleMatrix, success = server.getVehiclePos(vehicleID)
        if success then
            dist = matrix.distance(targetLocaion, vehicleMatrix)
            if dist < maxDistance then
                nearbyVehicles[vehicleID] = {
                    distanceFromMainBody = dist,
                    matrix = vehicleMatrix
                }
            end
        else
            BU_Debug("failed to get vehicle pos")
        end
    end

    return nearbyVehicles
end