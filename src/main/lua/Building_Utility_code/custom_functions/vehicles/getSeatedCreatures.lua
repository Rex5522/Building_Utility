---gets creates in specified vehicles and returns seat data
---@param vehicles table
---@return table
function getSeatedCreatures(vehicles)
    local seatedCreatures = {
        notSeated = {},
        seated = {}
    }
    local count = 0
    if type(vehicles) ~= "table" or vehicles[1] == nil then
        BU_Debug("INVALID ARG",vehicles)
        return seatedCreatures
    end

    for index, vehicleID in ipairs(vehicles) do
        if count > 100 then
            BU_Debug("vehicle process limit reached")
            break
        end

        local vehicleComponents, success = server.getVehicleComponents(vehicleID)
        if success then
            local seats = vehicleComponents.components.seats
            for index2, seat in pairs(seats) do
                seat.vehicleID = vehicleID
                seat.type = "seat"
                if seat.seated_id == 4294967295 then
                    table.insert(seatedCreatures.notSeated, seat) -- nothing is in the seat
                else
                    table.insert(seatedCreatures.seated, seat) -- something is in the seat
                end
                -- BU_Debug(seat)
            end
        else
            BU_Debug("failed to get vehicle components from vehicle "..vehicleID)
        end
    end

    return seatedCreatures
end