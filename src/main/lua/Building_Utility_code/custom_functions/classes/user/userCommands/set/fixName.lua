--- fixes a user name
-- @param self
-- @return 
function userCommands:fixName(self)
    local name, success = server.getPlayerName(self.ID)
    if success and self.name == "unnamed client" then
        self.name = name
        BU_Debug("fixed a users name")
    end
end