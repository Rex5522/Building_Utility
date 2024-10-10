if command=="?info" then

    for index,inner in pairs(server.getVehicleData(one)["tags"]) do

        debug(index)
        debug(inner)

    end

end