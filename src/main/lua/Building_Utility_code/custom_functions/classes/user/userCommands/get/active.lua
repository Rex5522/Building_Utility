--- checks whether a user is active
-- @param self
-- @return whether the user is active
function userCommands:active(self)
    local activeUsers = G_userActivityList.active
    return (activeUsers[self.ID] ~= nil)
end