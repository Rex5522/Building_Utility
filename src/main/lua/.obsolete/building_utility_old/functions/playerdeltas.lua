
function PlayerDeltas()
    PlayerList = server.getPlayers()
    for Index, Player in pairs(PlayerList) do
        Position = server.getPlayerPos(Player.id)
        if PreviousPositions[Player.id] == nil then
            PreviousPositions[Player.id] = Position
        end
        Delta = matrix.distance(Position,PreviousPositions[Player.id]) * 12
        Deltas[Player.id] = Delta
        PreviousPositions[Player.id] = Position
        X,Y,Z = matrix.position(Position)
    end
end