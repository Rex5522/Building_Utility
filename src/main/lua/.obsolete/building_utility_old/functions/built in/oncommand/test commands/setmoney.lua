if command=="?setmoney" then
    one = ton(one)
    two = ton(two)

    if one == nil or tonumber(one) == nil then 
        display(user_id, "command-format:\n?setmoney money researchPoints" ,2) 
        return false
    end
    if two==nil then two = server.getResearchPoints() or 0 end
    server.setCurrency(one, two)
    display(user_id, "updated money/research:\n\nmoney: "..one.."\nresearch points: "..two, 3)
end