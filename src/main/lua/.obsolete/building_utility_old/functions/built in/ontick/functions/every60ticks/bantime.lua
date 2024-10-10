for index, inner in pairs(g_savedata["bantime"]) do
    steam_id=tostring(index)
    if g_savedata["bantime"][steam_id]~=nil then
        g_savedata["bantime"][steam_id]=g_savedata["bantime"][steam_id]-1
        
        if g_savedata["bantime"][steam_id]<=0 then
            g_savedata["bantime"][steam_id]=nil
            g_savedata["playerdata"][steam_id]["banned"]=false
        end
    end
end