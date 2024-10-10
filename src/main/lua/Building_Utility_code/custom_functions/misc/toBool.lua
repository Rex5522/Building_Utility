--- reanslates a string to bool
-- @param str
-- @return string ot nil
function toBool(str)
    if str == "true" then
        return true
    elseif str == "false" then
        return false
    end

    return nil
end