function manageMeanTable(tableRefrence, valueToAdd, itemLimit)
    if not tableRefrence then
        return 0
    end

    -- table management
    table.insert(tableRefrence, valueToAdd)
    while #tableRefrence > itemLimit do
        table.remove(tableRefrence, 1)
    end

    -- get total of value
    local total = 0
    for _, value in pairs(tableRefrence) do
        total = total + value
    end

    return total / #tableRefrence
end