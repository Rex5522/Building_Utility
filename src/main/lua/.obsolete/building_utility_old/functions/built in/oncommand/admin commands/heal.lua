if command=="?heal"then
    one=tonumber(one)
    if one~=nil then
        heal(one)
        server.notify(user_id, "server-admin", "healed "..who(one, 1), 7)
        server.notify(one, "server: message", who(user_id, 1).." healed you", 7)
    else
        server.notify(user_id, sname, "healing you", 7)
        heal(user_id)
    end
end