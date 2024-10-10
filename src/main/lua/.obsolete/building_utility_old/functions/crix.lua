function crix(rix,x,y,z)

    local x = ton(x)
    local y = ton(y)
    local z = ton(y)

    local x1,y1,z1 = matrix.position(rix)
    return matrix.translation(x+x1,y+y1,z+z1)

end