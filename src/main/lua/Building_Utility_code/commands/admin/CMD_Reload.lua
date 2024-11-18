--- reloads building utility
-- @param data
-- @return nil
function CMD_Reload(data)
    BU_Reload(true)
    local user = data.user
    user:display("reloaded", true)
end