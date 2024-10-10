PLAYER_LIST = server.getPlayers()
for Index1, Player in pairs(PLAYER_LIST) do
    Position = server.getPlayerPos(Player.id)
    X,Y,Z = matrix.position(Position)
    TILE_DATA  = server.getTile(Position)
    if not Success and TILE_DATA.name ~= nil and Y > 10 and Y < 250 and Deltas[Player.id] <= 25 then
        Redundant = false
        for Index2, DementiaPosition in pairs(DementiaPositions) do
            Distance = matrix.distance(Position,DementiaPosition)
            if Distance <= 100 then
                Redundant = true
            end
        end
        if not Redundant then
            DementiaPositions[DementiaIndex] = Position
            DementiaIndex = DementiaIndex + 1
            if DementiaIndex > 100 then
                DementiaIndex = 0
            end
        end
    end
end