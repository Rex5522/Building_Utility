if g_savedata["DisarmSettings"] ~=nil then
    for Index, DisarmSetting in pairs(g_savedata["DisarmSettings"]) do
        if DisarmSetting then
            DisarmPlayer(Index)
        end
    end
end