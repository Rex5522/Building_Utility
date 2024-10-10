if g_savedata["server"]["noc4"] then
    for index, inner in pairs(g_savedata["active"]) do
        object_id=who(inner, 5, "s")
        for v=1,10 do
    
            EQUIPMENT_ID, is_success = server.getCharacterItem(object_id, v)
        
            if EQUIPMENT_ID==32 or EQUIPMENT_ID==31 then
                is_success = server.setCharacterItem(object_id, v, 0, false)
            end
        end
    end
end