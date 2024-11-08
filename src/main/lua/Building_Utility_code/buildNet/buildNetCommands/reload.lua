function buildNetCommands:reload(self)
    self.port = 5000
    self.url = "http://127.0.0.1:"
    self.maxChar = 3500
    self.endpoints = {
        ["debug"] = "/BU_Debug",
        ["table"] = "/table",
        ["heartbeat"] = "/heartBeat",
        ["normal"] = "/normal"
    }
end
