if command=="?gettile"then
    TILE_DATA, is_success = server.getTile(gps(0,0,false,user_id))
    for index,inner in pairs(TILE_DATA) do
        debug("index: "..index)
        debug(inner)
    end
end