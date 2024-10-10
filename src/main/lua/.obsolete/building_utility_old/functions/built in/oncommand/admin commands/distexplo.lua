if command=="?distexplo"then
    if g_savedata["server"]["dlc_weapons"] then
        rix=gps(one, 0, true, user_id)
        server.spawnExplosion(rix, two)
    else
        display(user_id, "sorry but you do not have the weapons dlc", 2)
    end
end