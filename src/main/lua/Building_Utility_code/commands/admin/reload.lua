--- reloads building utility
-- @param data
-- @return nil
function CMDreload(data)
    BU_Reload()
    local user = data.user
    user:display("reloaded", true)
end