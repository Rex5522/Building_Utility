end
if tick>=60 then
    tick=0
    g_savedata["server"]["seconds"]=g_savedata["server"]["seconds"]+1
    seconds=g_savedata["server"]["seconds"]