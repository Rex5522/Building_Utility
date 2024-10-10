--- compares a list of strings to 1 string
-- @param compare string, a string to compair againsts the others
-- @return whether a match was found
function compareStrings(compare, ...)
    strings = {...}
    for index, str in pairs(strings) do
        if compare == str then
            return true
        end
    end

    return false
end