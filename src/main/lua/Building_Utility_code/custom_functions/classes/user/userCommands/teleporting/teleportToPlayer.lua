--- teleports the user to a player
-- @param self
-- @param targetUser table, the target userObject
-- @return true or false depending on if the player was teleported
function userCommands:teleportToPlayer(self, targetUser)
    local targetPos = targetUser:getLocation()
    local success = server.setPlayerPos(self.ID, targetPos)
    return success
end