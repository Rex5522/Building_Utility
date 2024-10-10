--- Debugs a table in a format that can be read easily.
-- @param tableToDebug table, The table to debug.
-- @param recursionLevel int, The current level of recursion (used for indentation).
-- @param displayingFunctions Boolean, whether to ignore function entries.
-- @return A formatted string representing the table.
function debugTable(tableToDebug, recursionLevel, displayingFunctions) -- this functions a mess but i love it
    recursionLevel = recursionLevel or 0
    displayingFunctions = displayingFunctions or false
    local count = 0
    local str = "table:"
    local indent = string.rep("--", recursionLevel)
    local functions = {}
    
    if not tableToDebug or type(tableToDebug) ~= "table" then
        BU_Debug("aborting due to null or invalid table")
        return "NULL TABLE"
    end
    
    if recursionLevel > 10 then
        BU_Debug("aborting due to, to many recursions")
        return "TO MANY RECURIONS"
    end

    for index,inner in pairs(tableToDebug) do
        
        if type(inner) == "function" then
            table.insert(functions, index)
        else
            count = count + 1
            str = str.."\n"
            if type(inner) == "table" then
                inner = debugTable(inner, recursionLevel + 1)
                
            end
            if displayingFunctions then
                str = str..indent.."("..tostring(count)..") "..tostring(inner)
            else
                str = str..indent.."("..tostring(count)..") "..tostring(index)..": "..tostring(inner)
            end
        end
    end

    if not displayingFunctions and #functions > 0 then
        str = str.."\n"..indent.."functions "..debugTable(functions, recursionLevel + 1, true)
    end

    return str
end