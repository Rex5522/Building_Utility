function caseInsensitiveTableSearch(table, targetValue, recursively)
    local indexRefrence
    for index, inner in pairs(table) do
        if tostring(index):lower() == targetValue:lower() then
            return index
        end

        if tostring(inner):lower() == targetValue:lower() then
            return index
        end

        if type(inner) == "table" and recursively then
            indexRefrence = caseInsensitiveTableSearch(inner, targetValue, recursively)

            if indexRefrence then
                return indexRefrence
            end
        end
    end

    return nil
end