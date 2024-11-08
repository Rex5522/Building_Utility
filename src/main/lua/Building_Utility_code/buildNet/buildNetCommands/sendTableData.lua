function buildNetCommands:sendTableData(self, data, dataEncoded)
    dataEncoded = dataEncoded or false

    self:sendMessage(tableToString(data), nil)
end

function tableToString(tbl, indentationLevel)
    local indentationLevel = indentationLevel or 0
    local indent = string.rep("   ", indentationLevel)
    local str = "{\n"
    for k, v in pairs(tbl) do
        -- Format key-value pairs
        if type(v) == "table" then
            v = tableToString(v, indentationLevel + 1)
        else
            v = "\""..tostring(v).."\""
        end

        if type(k) == "number" then
            k = string.format("[%d]", k)
        end

        str = str.. indent .. "   " .. tostring(k) .. " = " .. tostring(v) .. ",\n"
    end
    -- Remove the last comma and space
    if next(tbl) ~= nil then
        str = str:sub(1, -3)
    end
    str = str.."\n"..indent.."}"
    return str
end