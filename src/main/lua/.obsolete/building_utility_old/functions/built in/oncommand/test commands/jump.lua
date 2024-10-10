if command=="?jump" then
    rix=gps(-12, 2, true, user_id)
    x,y,z = matrix.position(rix)
    x=x+xx
    y=y+yy
    z=z+zz
    sw1=0.5
    rix = matrix.translation(x,y,z)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    heal(user_id)
end