function onTick(tick)
    G_Tick = G_Tick + 1

    for userID, user in pairs(getActiveUsers()) do

        if G_Tick % 10 == 0 then
            user:updatePos()
            user:updateHud() -- update pos must come first
        end

        regen(user)
    end

    getTPS()
    delayCommand()
end