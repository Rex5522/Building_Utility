function createBuildNet()
    local buildNet = {

    }

    for name, func in pairs(buildNetCommands) do
        buildNet[name] = function(...) return func(buildNet, ...) end
    end

    buildNet:reload()
    g_savedata.buildNet = buildNet

    return buildNet
end