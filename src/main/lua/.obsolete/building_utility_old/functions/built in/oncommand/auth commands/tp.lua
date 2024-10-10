if command == "?tp" and debugsv or command == "?tp" and admin then
    if one ~= nil then
        vtype=what(one,steam_id,true)
        if two~=nil then
            if vtype=="lc" then
                server.notify(user_id,sname..error,"cannot teleport a location to something else",7)
            elseif vtype=="seat" then
                server.notify(user_id,sname..error,"cannot teleport a seat to something else",7)
            elseif vtype=="user" then
                tpplayer(one,two,user_id,true)
            elseif vtype=="vehicle" then
                tpvehicle(one,two,user_id,true,true)
            else
                server.notify(user_id,sname.."\n"..error,"unable to determine victom",7)
            end
        else
            if vtype=="lc" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="seat" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="user" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="vehicle" then
                tpplayer(user_id,one,user_id,true)
            else
                server.notify(user_id,sname..error,"unable to determine target",7)
            end
        end
    else
        server.notify(user_id,sname..cmdf,"?tp userid/vehicleid/lc userid/vehicleid/lc",7)
    end
end