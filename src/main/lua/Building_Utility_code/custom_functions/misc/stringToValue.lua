function stringToValue(value)
    local num = tonumber(value)
    if num ~= nil then
        return num
    elseif value == "true" then
        return true
    elseif value == "false" then
        return false
    end
    return nil
end