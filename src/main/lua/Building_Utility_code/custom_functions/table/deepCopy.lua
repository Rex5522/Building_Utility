---deep copys a table
---@param targetTable table
---@return table
function deepCopy(targetTable)
    local copy = {}
    
    for key, value in pairs(targetTable) do
        if type(value) == "table" then
            copy[key] = deepCopy(value)
        else
            copy[key] = value
        end
    end

    return copy
end