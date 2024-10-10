if command=="?cleardead" then
    count=0
    for i=1,99999 do
        OBJECT_DATA = server.getObjectData(i)
        if OBJECT_DATA~=nil then
            if OBJECT_DATA["dead"] then
                is_success = server.despawnObject(i, true)
                if is_success then count=count+1 end
            end
        end
    end
    server.notify(user_id, sname, "despawned: "..count.." dead body's", 7)
end