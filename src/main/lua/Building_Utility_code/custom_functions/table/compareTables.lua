--- replaces any nil values found in tableToFix with the ones from the same index in completeTableData
-- @param completeTableData, the table will all the data that should be in tableToFix
-- @param tableToFix, the table to fix the data in
-- @param fix, toggles whether it fixes nill value sthat are found
-- @return table(the fixed table) or nil (TODO return true if tableToFix does not contain all data)
function compareTables(completeTableData, tableToFix, fix)
    if not completeTableData or not tableToFix then
        BU_Debug("error: tables must not be nil")
        return nil
    end

    for index,inner in pairs(completeTableData) do
        if tableToFix[index] == nil and fix then
            tableToFix[index] = inner
        end

        if type(tableToFix[index]) == "table" then
            compareTables(completeTableData[index], tableToFix[index], fix)
        end
    end

    return tableToFix
end