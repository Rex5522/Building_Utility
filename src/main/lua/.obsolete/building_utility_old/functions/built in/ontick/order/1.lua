function onTick(game_ticks)
    if not g_savedata["server"]["disabled"]["ontick"] then
        
    if game_ticks2==nil then game_ticks2=0 end
    if game_ticks2>g_limit then game_ticks2=0 else game_ticks2=game_ticks2+1 end