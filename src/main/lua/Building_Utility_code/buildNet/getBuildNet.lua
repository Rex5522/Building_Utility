function getBuildNet()
    local buildNet = g_savedata.buildNet or createBuildNet()

    for dataName, data in pairs(buildNet) do
        if type(data) == "function" and not buildNetCommands[dataName] then
            buildNet[dataName] = nil
        end
    end

    -- add or update commands
    for name, func in pairs(buildNetCommands) do
        buildNet[name] = function(...) return func(buildNet, ...) end
    end

    buildNet.port = 5000
    buildNet.url = "http://127.0.0.1:"
    buildNet.maxChar = 3500
    buildNet.endpoints = {
        ["debug"] = "/BU_Debug",
        ["table"] = "/table",
        ["heartbeat"] = "/heartBeat",
        ["normal"] = "/normal"
    }

    return buildNet
end