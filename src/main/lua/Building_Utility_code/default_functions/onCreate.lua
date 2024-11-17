function onCreate(worldCreation)
    local buildNet = getBuildNet()

    BU_Reload()

    if worldCreation then
        BU_Init()
    end
end