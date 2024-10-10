function onCreate(worldCreation)
    local buildNet = getBuildNet()
    for name, func in pairs(buildNetCommands) do
        buildNet[name] = function(...) return func(buildNet, ...) end
    end
    buildNet:reload()
    
    if worldCreation then
        BU_Init()
    end
    BU_Reload()
end