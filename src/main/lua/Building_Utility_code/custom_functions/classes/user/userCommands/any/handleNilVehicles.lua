function userCommands:handleNilVehicles(self)
    local validVehicles = {}
    for index, groupID in ipairs(self.vehicles) do
        local _, success = server.getVehicleGroup(groupID)
        if success then
            table.insert(validVehicles, self.vehicles[index])
        end
    end

    self.vehicles = validVehicles
end