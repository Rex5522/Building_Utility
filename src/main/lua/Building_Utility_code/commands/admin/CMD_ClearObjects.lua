--- clears objects
-- @param data
-- @return nil
function CMD_ClearObjects(data)
    local despawned = 0

    for i = 1, 100000 do
        local success = server.despawnObject(i, true)
        if success then
            despawned = despawned + 1
        end
    end

    data.user:display("despawned "..despawned.." objects", (despawned > 0))
end