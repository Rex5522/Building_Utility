if command=="?spawnobject" then
    object_id, is_success = server.spawnObject(gps(5,1,true, user_id), one)
    if is_success then
        display(user_id, "spawned object", 3)
    else
        display(user_id, "failed to spawn object", 2)
    end
end