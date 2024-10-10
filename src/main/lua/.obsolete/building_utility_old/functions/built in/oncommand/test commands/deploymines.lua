if command=="?deploymines" then
    rix = gps(0,0,false,user_id)
    x,y,z = matrix.position(rix)
    server.spawnExplosion(rix, 0)
    one = ton(one)
    two = ton(two)
    three = tonumber(three)

    debug(one.."\n"..two.."\n"..three.."\n")
    count = 0
    for index,inner in pairs(sd1["scanned"]) do
        debug(inner["rix"])
        debug(inner["v"])
        dist = matrix.distance(rix, inner["rix"])
        if dist < two and count <= one then
            x1,y,z1 = matrix.position(inner["rix"])
            y1 = inner["v"]
            rix2 = matrix.translation(x1,y1,z1)
            g_savedata["server"]["mines"][tablelen(g_savedata["server"]["mines"])+1]={["size"]=three,["bpm"]=60,["decay"]=(30*60)*60,["rix"]=rix2}
            count = count + 1
        elseif count >= one then
            break
        end
    end
    debug("11111")
    --x1 = random(x-two,x+two)
    --y1 = random(y-two,y+two)
    --z1 = random(z-two,z+two)
    
    --server.spawnExplosion(rix2, 1)
    
end

--?deploymines 100 500