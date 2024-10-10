if command=="?is_dev" then 
    if server.isDev() then 
        server.announce("[Server]", "the host player is a dev of the game", user_id) 
    else 
        server.announce("[Server]", "the host player is not a dev of the game", user_id)
    end
end