--- reloads building utility
-- @param data
-- @return nil
function reload(data)
    BU_Reload()
    local user = data.user
    user:display("reloaded", true)
end