function buildNetCommands:encodeData(self, str)
    if type(str) ~= "string" then
        return false -- Do not debug inside this function as it may cause an infinite loop
    end

    -- Encode the data, ensuring proper percent-encoding
    local encodedData = string.gsub(str, "([^%w])",
    function(c)
        return string.format("%%%02X", string.byte(c))
    end)

    local lengthOfMessage = string.len(encodedData)
    local newMessageStartIndex = 1
    local count = 0
    local packet = ""
    local targetIndex = 0
    local packets = {}
    while targetIndex < lengthOfMessage do
        if count > 1000 then
            BU_Debug("!DEBUG:NONET!", "ERROR: exceeded max repeat limit", lengthOfMessage, newMessageStartIndex)
            break
        end

        targetIndex = math.min(newMessageStartIndex + self.maxChar, lengthOfMessage)
        
        if string.sub(encodedData, targetIndex - 2, targetIndex - 2) == "%" then
            targetIndex = targetIndex - 3
        elseif string.sub(encodedData, targetIndex - 1, targetIndex - 1) == "%" then
            targetIndex = targetIndex - 2
        elseif string.sub(encodedData, targetIndex, targetIndex) == "%" then
            targetIndex = targetIndex - 1
        end
        if lengthOfMessage - targetIndex < 500 then
            targetIndex = lengthOfMessage
        end
        packet = encodedData:sub(newMessageStartIndex, targetIndex)
        table.insert(packets, packet)

        newMessageStartIndex = targetIndex + 1
        count = count + 1
    end

    if #packets >= 1 then
        return packets
    else
        return encodedData
    end
end