if command=="?spawnlc" then -- update done

    txt = ""
    pd["spawnlc"] = toggle(pd["spawnlc"])

    if one ~= nil then
        if pd["lc"][one] ~= nil then
            pd["lc"]["spawnlc"] = pd["lc"][one]
            txt = "set your spawnlc to "..one
        else
            txt = "the location you specified does not exist in your saved lc's"
        end
    else
        txt = "please remember to to save your spawnlc using ?set lc spawnlc"
    end

    if pd["spawnlc"] then
        display(user_id, "spawnlc enabled. "..txt, 1)
    else
        display(user_id, "spawnlc disabled. "..txt, 1)
    end
end