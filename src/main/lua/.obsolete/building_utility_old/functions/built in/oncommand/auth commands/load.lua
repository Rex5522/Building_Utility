if command=="?load" then
    if one~=nil then
        if loadinv(user_id,one) then
            server.notify(user_id, sname, "loaded inventory: "..one, 7)
        else
            server.notify(user_id, sname, "failed to load inventory: "..one, 7)
        end
    else
        server.notify(user_id, sname..cmdf, "?load slotname", 7)
    end
end