function buildNetCommands:sendMessage(self, data, dataEncoded)
    dataEncoded = dataEncoded or false
    -- build url
    if not dataEncoded then
        data = (self:encodeData(data) or "ERROR")
    end
    if not data then
        return
    end

    local url = self.url..self.endpoints.debug.."?".."message="..data



    server.httpGet(self.port, url)
end
