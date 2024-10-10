if g_savedata["AntiNoClipSettings"] ~=nil then
    for Index, AntiNoClipSetting in pairs(g_savedata["AntiNoClipSettings"]) do
        if AntiNoClipSetting then
            AntiNoClip(Index)
        end
    end
end