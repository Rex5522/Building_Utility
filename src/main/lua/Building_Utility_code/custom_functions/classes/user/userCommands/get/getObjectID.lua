--- gets the objectID of the user
-- @param self
-- @return objectID or nil
function userCommands:getObjectID(self)
    objectID, success = server.getPlayerCharacterID(self.ID)

    return objectID or nil, success
end