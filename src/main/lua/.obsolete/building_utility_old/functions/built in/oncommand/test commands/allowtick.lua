if command=="?allowtick" then
    g_savedata["server"]["disabled"]["ontick"] = not g_savedata["server"]["disabled"]["ontick"]
    if g_savedata["server"]["disabled"]["ontick"] then
        display(user_id,"ontick function disabled",2)
    else
        display(user_id,"ontick function enabled",3)
    end
end