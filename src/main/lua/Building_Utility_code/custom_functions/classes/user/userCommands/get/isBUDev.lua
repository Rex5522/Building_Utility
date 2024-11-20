function userCommands:isBUDev(self)
    for index, devData in pairs(G_Contributers.devs) do
        if self.steamID == devData.steamID then
            return true
        end
    end

return false
end