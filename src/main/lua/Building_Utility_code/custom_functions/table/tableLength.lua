function tableLength(table)
    count = 0
    if table then
        for key, value in pairs(table) do
            count = count + 1
        end
    end
    return count
end