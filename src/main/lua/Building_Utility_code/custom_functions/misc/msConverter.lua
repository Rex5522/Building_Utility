--- converts ms to another speed
-- @param ms
-- @param target, the target speed unit e.g km/h
-- @return ms or the converted speed
function msConverter(ms, target)
    if not G_UnitConversions[target] then
        return ms
    end

    return ms * G_UnitConversions[target]
end