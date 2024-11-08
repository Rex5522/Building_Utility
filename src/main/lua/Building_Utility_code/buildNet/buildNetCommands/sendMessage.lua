function buildNetCommands:sendMessage(self, data, isDataEncoded, endpoint)
    isDataEncoded = isDataEncoded or false
    local messagesSent = 1
    if not isDataEncoded then
        data = (self:encodeData(data) or "DATA_ENCODE_ERROR")
    end

    if not self.endpoints[endpoint] then
        endpoint = "debug"
    end
    local url = self.url .. self.endpoints[endpoint]


    if type(data) ~= "table" then
        data = {data}
    end

    for index, packet in ipairs(data) do
        local httpRequest = url .. "?data=" .. packet

        if string.len(url) > self.maxChar + 150 then
            httpRequest = url .. "?ERROR=MESSAGE_TOO_LONG"
        end
    
        server.httpGet(self.port, httpRequest)
        messagesSent = messagesSent + 1
    end

    server.httpGet(self.port, url .. "?end=true")
    -- BU_Debug("!DEBUG:NONET!", "sent "..messagesSent.." messages to buildNet")
end
