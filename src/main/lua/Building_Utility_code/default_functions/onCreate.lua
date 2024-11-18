function onCreate(worldCreation)
    local buildNet = getBuildNet()
    BU_Reload(true)

    if worldCreation then
        BU_Init()
    end
end