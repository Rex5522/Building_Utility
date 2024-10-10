if command=="?scan" then
    rix = gps(0,0,false,user_id)
    sd1["scanners"]={["rix"]=rix,["amount"]=ton(one),["lifetime"]=0.5,["h-offset"]=60,["per"]=(tonumber(three) or 30),["area"]=ton(two)}
end