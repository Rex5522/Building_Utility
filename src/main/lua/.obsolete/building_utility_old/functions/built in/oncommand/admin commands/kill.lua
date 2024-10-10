if command=="?kill" then
    one=tonumber(one)
    if one~=nil then
        server.notify(user_id, "server-admin", "killing "..who(one, 1), 7)
        server.notify(one, "server: message", "you were killed by an admin", 7)
        server.killCharacter(who(one, 5))
    end
end