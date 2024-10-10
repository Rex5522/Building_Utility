--- changes a boolean value to a string version
-- @param bool, the bool to be changed
-- @param returnType, changes what type of string bool is returned
-- @return string or nil
function booleanTranslator(bool, returnType)
    if returnType == nil then
        returnType = 1
    end

    if bool == nil then
        return nil
    end

    if returnType == 1 then
        if bool then
            return "enabled"
        else
            return "disabled"
        end
    elseif returnType == 2 then
        if bool then
            return "ON"
        else
            return "OFF"
        end
    end

end