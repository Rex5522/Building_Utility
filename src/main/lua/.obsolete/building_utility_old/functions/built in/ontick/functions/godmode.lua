for index, inner in pairs(g_savedata["active"]) do
    if pd1[index]["godmode"] then
        ob = who(index,5,"s")
        server.reviveCharacter(ob)
        server.setCharacterData(ob, 9999999, false, false)
    end
end
