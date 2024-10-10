--- gets the prefix of a string
-- @param string
-- @return false or prefix
function getPrefix(string)
    if type(string) ~= "string" then
        BU_Debug("type must be string", type(string))
        return false
    end
    local prefix = string.sub(string, 1, 1)

    if not prefix:match("%a") or not tonumber(string.sub(string, 2)) then
        return false
    end

    return prefix:lower()
end