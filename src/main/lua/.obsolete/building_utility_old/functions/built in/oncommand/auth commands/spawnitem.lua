if command=="?spawnitem" then
    object_id, is_success = server.spawnEquipment(gps(5,1,true, user_id), one, findeqv(one,false,"v"), findeqv(one,true,"v"))
    if is_success then
        display(user_id, "spawned item", 3)
    else
        display(user_id, "failed to spawn item", 2)
    end
end