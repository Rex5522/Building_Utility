--- fixes player file by adding any nil values from a fake default user
-- @param self,
-- @return nil
function userCommands:fixFile(self)
    local fakeUser = userClass:createUser("010101", "fakeName", 0, true)
    compareTables(fakeUser, self, true)
end