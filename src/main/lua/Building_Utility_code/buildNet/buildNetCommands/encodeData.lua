function buildNetCommands:encodeData(self, str)
    if type(str) ~= "string" then
        return false -- do not debug inside this function as it may cause and inf loop
    end

    local encodedData = string.gsub(str, "([^%w])",
    function(c)
        return string.format("%%%02X", string.byte(c))
    end)

    local length = string.len(encodedData)
    if length > self.maxChar then
        local totalPackets = math.ceil(length / self.maxChar)
        local i = 1
        local endIdx
        local str2
        local count = 1
        while i <= length do
            if count > 1000 then
                BU_Debug("ERROR: exceeded max repeat limit", endIdx, i, length)
                break
            end
            
            endIdx = i + self.maxChar - 1

            if string.sub(encodedData, endIdx - 2, endIdx - 2) == "%" then
                endIdx = endIdx - 3 -- Move back by 3 to start at a safe boundary
            elseif string.sub(encodedData, endIdx - 1, endIdx - 1) == "%" then
                endIdx = endIdx - 2 -- Move back by 2 to align at a safe boundary
            end
            
            str2 = string.sub(encodedData, i, endIdx)
            self:sendMessage(str2, true)

            i = endIdx + 1

            count = count + 1
        end
        return false
    end


    return encodedData
end
