--- gets the objectID of the user
-- @param self
-- @return objectID or nil
function userCommands:getObjectID(self)
    local objectID, success = server.getPlayerCharacterID(self.ID)

    return objectID or nil, success
end