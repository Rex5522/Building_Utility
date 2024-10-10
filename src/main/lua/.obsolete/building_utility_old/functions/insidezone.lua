function insidezone(id,rix,size,returnt,vehicles,players)
    if returnt == nil then returnt = false end
    v = false
    ids = {}
	players = server.getPlayers()
    table = {}
    count = 1
    limit = 100

    if vehicles then
        for index,inner in pairs(g_savedata["vehicles"]) do
            for index2,inner2 in pairs(inner["live"]) do
                table[count]={["rix"]=server.getVehiclePos(index2),["id"]=index2}
                count = count + 1
                limit = limit - 1
                if limit <=0 then debug("TO MANY VEHICLES") break end
            end
        end
    end

    if players then
        for index,inner in pairs(players) do
            if id~=nil then fid = id else fid = inner.id end
            table[count]={["rix"]=server.getPlayerPos(fid),["id"]=fid}
            count = count + 1
        end
    end
    
	for index,inner in pairs(table) do
        x2,y2,z2 = matrix.position(inner["rix"])
		x, y, z = matrix.position(rix)
		distSQ = ((x2 - x) ^ 2) + ((y2 - y) ^ 2) + ((z2 - z) ^ 2)


        if id~=nil then return (distSQ < size) end
        if not v then v = (distSQ < size) end


        if returnt and (distSQ < size) then
            ids[inner["id"]]=inner["id"]
        end
    end
    if returnt then
        return ids
    else
        return v
    end
end