    --delta
    Players = server.getPlayers()
    for Index1, Player in pairs(Players) do
        PlayerPosition = server.getPlayerPos(Player.id)
        PlayerX,PlayerZ,PlayerY = matrix.position(PlayerPosition)
        for Index2, Vehicle in pairs(g_savedata["vehicles"]) do
            server.setVehicleKeypad(Index2,Player.name .. " XY",PlayerX,PlayerY)
            server.setVehicleKeypad(Index2,Player.name .. " Z",PlayerZ)
        end
    end