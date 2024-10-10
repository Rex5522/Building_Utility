if command=="?list" then
		
    txt=""
    v_count = 0
    for index,inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do

        v_count = v_count + 1
        id=inner.id
        txt=txt.."vehicle ["..index.."] {id: "..id.."}\n"


    end
    if v_count > 0 then
        display(user_id, txt, 1)
    else
        display(user_id, "no owned vehicles found", 1)
    end
end