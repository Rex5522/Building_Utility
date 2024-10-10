-- this function is meant to toggle the hud menu. 
-- for admins youll be able to see speed, vehicle id, owner id, etc. for auth youll be able to see values inside of dials on your hud

if command=="?hud" then

    display(user_id, "command not ready", 2)
    if true then return end
    pd["hud"] = not pd["hud"]
    if pd["hud"] then
        display(user_id, "hud enabled", 3)
    else
        display(user_id, "hud disabled", 2)
    end
end