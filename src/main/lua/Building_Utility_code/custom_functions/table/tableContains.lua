--- checks if a table contains a value then returns the index if the target is found
-- @param targetTable table, the table to check
-- @param target any, the value to check
-- @return the index of the table target was found or nil
function tableContains(targetTable, target)
    for index, inner in pairs(targetTable) do
        if inner == target then
            return index
        end
    end
    return nil
end