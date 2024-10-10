for index,inner in pairs(g_savedata["server"]["mines"]) do
    -- debug(index)
    -- debug(inner["size"])
    g_savedata["server"]["mines"][index]["decay"] = inner["decay"]-1
    debug(inner["size"])
    if insidezone(nil,crix(inner["rix"],0,1,0),(inner["size"]*30),false,true,true) then
        server.spawnExplosion(inner["rix"], inner["size"])
        explo = true
    elseif inner["decay"] % 60 == 0 then
        server.spawnExplosion(inner["rix"], 0)
        explo = false
    else
        explo = false
    end

    if inner["decay"] <= 0 or explo then g_savedata["server"]["mines"][index] = nil end
end