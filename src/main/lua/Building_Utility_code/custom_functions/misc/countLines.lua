--- counts amount of new lines in a string
-- @param str
-- @return count or nil
function countLines(str)
    if type(str) ~= "string" then
        BU_Debug("INVALID TYPE: "..type(str))
        return nil
    end

    local _, count = str:gsub("\n", "")
    return count
end