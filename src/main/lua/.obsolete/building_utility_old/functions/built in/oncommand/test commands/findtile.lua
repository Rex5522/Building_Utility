if command=="?findtile" then
    if one~=nil and two~=nil then
        transform_matrix, is_success = server.getTileTransform(gps(0,0,false,user_id), one, two)

        if is_success then
            x,y,z = matrix.position(transform_matrix)
            display(user_id,"tile found:\nx: "..x.."\ny: "..y.."\nz: "..z,1)
        else
            display(user_id,"command failed",2)
        end
    else
        display(user_id,"command format:\n?findtile TILENAME SEARCHRANGE",2)
    end
end