if command=="?clean" then
    count=0
    for i=1,99999 do
        is_success = server.despawnObject(i, true)
        if is_success then count=count+1 end
    end
    server.notify(user_id, "server-command", "removed "..tostring(count).." items/objects", 7)
end