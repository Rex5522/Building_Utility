for index,inner in pairs(g_savedata["active"]) do
    if g_savedata["playerdata"][inner]["follow"]["id"]~=-1 and g_savedata["playerdata"][inner]["follow"]["id"]~=nil then
        rix, is_success = server.getVehiclePos(pd1[inner]["follow"]["id"])
        if is_success then
            dist = g_savedata["playerdata"][inner]["follow"]["dist"]
            out_matrix = matrix.translation(-dist,dist,-dist)
            out_matrix = matrix.multiply(rix, out_matrix)
            is_success = server.setPlayerPos(pd1[inner]["id"], out_matrix)
        end
    end 
end


