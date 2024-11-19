function onTick(tick)
    G_Tick = G_Tick + 1
    updateUserActivityList()


        if G_Tick % 60 == 0 then
        end
        
    for userID, user in pairs(G_userActivityList.active) do
        if G_Tick % 5 == 0 then
            user:updatePos()
            user:updateHud() -- update pos must come first
        end

        regen(user)
    end

    if G_Tick % 60 == 0 then
        getTPS()
    end
    delayCommand()
end