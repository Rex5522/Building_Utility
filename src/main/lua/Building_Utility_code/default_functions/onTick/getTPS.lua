--- gets the tps of the server
-- @return nil
function getTPS()
    G_CurrentTime = server.getTimeMillisec()
    local diffrence = (G_CurrentTime - (G_PreviousTime or 0)) / (G_Tick - (G_LastTPSCalcTick or 0))
    G_TPS = (1000 / diffrence)
    G_LastTPSCalcTick = G_Tick
    G_PreviousTime = G_CurrentTime
end