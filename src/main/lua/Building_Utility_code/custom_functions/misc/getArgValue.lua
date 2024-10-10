--- gets a args prefix and its speciffied value
-- @param arg string, the arg
-- @param targetPrefixes table, the table of single char prefixes that you are looking for
-- @param lookupTables table or nil, a table conting tables corresponding to same index of the target prefix
-- @param lookupFunctions table or nil, a list containing a function to exexecute the if the corresponding index of the prefix matches.
-- @return {target or nil, prefix or nil, command interpretation of arg}
function getArgValue(arg, targetPrefixes, lookupTables, lookupFunctions)
    local prefix = getPrefix(arg)
    local properArg
    local commandInterpretation
    local index

    

    for listIndex, listPrefix in ipairs(targetPrefixes) do
        if prefix == listPrefix then
            index = listIndex
            commandInterpretation = "PREFIX: "..string.sub(arg, 1, 1).."\vID_or_Name: "..string.sub(arg, 2)
            properArg = string.sub(arg, 2)
            break
        end
    end

    if not index then
        commandInterpretation = "PREFIX: none\nID_or_Name: "..tostring(arg)
        properArg = arg
    end

    if prefix then -- prefix provided
        if lookupTables[index] then
            BU_Debug("using a table")
            return {lookupTables[index][properArg], prefix, commandInterpretation, properArg}
        elseif lookupFunctions[index] then
            BU_Debug("using a function")
            return {lookupFunctions[index](properArg), prefix, commandInterpretation, properArg}
        else
            return {properArg, prefix, commandInterpretation, properArg}
        end
    elseif not prefix then -- prefix not provided
        local value
        local indexFound
        for i = 1, #targetPrefixes do
            if lookupTables[i] then
                BU_Debug("found arg meaning on table index "..tostring(i))
                value = lookupTables[i][properArg]
            end
            if not value and lookupFunctions[i] then
                BU_Debug("found arg meaning on function index "..tostring(i))
                value = lookupFunctions[i](properArg)
            end

            if value then
                indexFound = i
                break
            end
        end
        if value then
            BU_Debug("found arg meaning")
            return {value, prefixes[indexFound], commandInterpretation, properArg}
        else
            BU_Debug("unable to find arg meaning")
            return {properArg, prefix, commandInterpretation, properArg}
        end
    else -- prefix provided but item not found
        return {properArg, prefix, commandInterpretation, properArg}
    end
end