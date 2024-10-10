function invscanner(user_id,target)
    for i=1,10 do
        EQUIPMENT_ID, is_success = server.getCharacterItem(who(user_id, 5, "s"), i)
            
        if EQUIPMENT_ID==target then
            return i
        end
    end
    return nil
end