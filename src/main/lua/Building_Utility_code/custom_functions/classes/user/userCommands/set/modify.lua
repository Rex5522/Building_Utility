--- idk if i will keep this
function userCommands:modify(self,valueName,value)
    if valueName == nil or value == nil then
        BU_Debug("one of the provided values was nil")
        return nil
    end
    
    if value == "!NOT!" then
        value = not self[valueName]
    end
end