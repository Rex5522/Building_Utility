--- returns user status 0/1/2 | any/auth/admin
-- @param self
-- @return the users status, never nil
function userCommands:getStatus(self)
    local status = 0
    local userStats
    
    for index, user in pairs(server.getPlayers()) do
        if user.id == self.ID then
            userStats = user
            break
        end
    end

    if not userStats then
        BU_Debug("failed to get user auth level")
        return 0
    end

    if userStats.admin then 
        status = 2
    elseif userStats.auth then
        status = 1
    end

    return status
end