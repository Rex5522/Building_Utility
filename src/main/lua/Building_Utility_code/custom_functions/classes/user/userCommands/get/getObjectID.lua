--- gets the objectID of the user
-- @param self
-- @return objectID or nil
function userCommands:getObjectID(self)
    objectID, success = server.getPlayerCharacterID(self.ID)

    if not success then
        BU_Debug("unable to get objectID of user "..self.steamID.."with the id of: "..tostring(self.ID))
        return nil
    end

    return objectID, success
end