if command=="?follow" then

    if tonumber(one)==-1 then 
        pd1[steam_id]["follow"]={["id"]=-1,["dist"]=10}
        display(user_id,"stopping follow",3)
    end

    if one==nil then
        display(user_id,"command-format:\n?follow VehicleId distance",1)
        return
    end

    if string.sub(one,1,1) == "i" then

        one = string.sub(one,2,-1)
        transform_matrix, is_success = server.getVehiclePos(one)

        if is_success then
            display(user_id,"following vehicle id: "..one,3)
        else
            display(user_id,"unable to find vehicle: "..one,2)
            return
        end
    else
        vs, is_success = server.getVehicleGroup(one)
        if is_success and vs[1]~=nil then
            display(user_id,"following vehicle id: "..one,3)
            one = vs[1]
        else
            display(user_id,"unable to find vehicle: "..one,2)
            return
        end
    end

    
    if two == nil or tonumber(two) <= 0 then two = 10 end
    pd1[steam_id]["follow"]={["id"]=one,["dist"]=tonumber(two)}

end