if command=="?ShowOil" then
    for index,inner in pairs(server.getOilDeposits()) do
        server.addMapObject(user_id, 017, 0, 9, inner.x, inner.z, 0, 0, 0, 0, "oil "..inner.oil.."\ndepth "..inner.y, 25, true, 0, 0, 0, 255)
    end
    delay("removemapid",user_id,017,nil,3600)
    display(user_id,"showing all oil nodes",3)
end