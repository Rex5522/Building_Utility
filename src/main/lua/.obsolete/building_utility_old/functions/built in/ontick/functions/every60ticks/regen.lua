if g_savedata["server"]["regen"] then
    for index,inner in pairs(g_savedata["active"]) do
        object_id=who(tostring(index),5,"s",false,false)
        if object_id ~= -1 then
            OBJECT_DATA = server.getObjectData(object_id)
            if not OBJECT_DATA["incapacitated"] and OBJECT_DATA["hp"]<100 then
                -- server.setCharacterData(object_id, OBJECT_DATA["hp"]+g_savedata["server"]["regen"], false, false)
            end
        end
    end
end