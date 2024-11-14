--- Orders a table based on specified nested keys.
--- @param targetTable table -- The table to be ordered, containing entries that may have nested tables.
--- @param ... string -- A variable number of arguments specifying the keys to traverse within each nested table.
--- @return table -- A table containing the values at the specified nested keys.
function orderTable(targetTable, ...)
    local args = {...}

    local returnTable = {}
    for index, inner in ipairs(targetTable) do
        local current = inner


        for _, arg in ipairs(args) do
            if type(current) == "table" and current[arg] then
                current = current[arg]
            else
                current = nil
            end
        end

        if current ~= nil then
            table.insert(returnTable, current)
        end
    end

    return returnTable
end