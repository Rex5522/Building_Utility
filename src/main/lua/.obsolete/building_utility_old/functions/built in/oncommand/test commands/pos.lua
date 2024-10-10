if command == "?pos" then
   rix = server.getPlayerPos(one)
   local x1,y1,z1 = matrix.position(rix)
   display(user_id,"x: "..x1.."\ny: "..y1.."\nz: "..z1,1)
end