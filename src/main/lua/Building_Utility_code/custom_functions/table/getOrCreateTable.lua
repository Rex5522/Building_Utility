---gets or creates a table
---@param startTable table, the table to index
---@param innerTableName string, the name of the table to get or create
---@return table
function getOrCreateTable(startTable, innerTableName)
    if type(startTable) == nil or innerTableName == nil then
        BU_Debug("startTable or innerTableName was nil")
        return {}
    end

    if not startTable[innerTableName] then
        startTable[innerTableName] = {}
    end
    
    return startTable[innerTableName]
end