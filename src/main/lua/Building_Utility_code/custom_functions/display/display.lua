--- displays text to a target user
-- @param text, string to be displayed to the user
-- @return nil
function display(text, targetID, notificationType, announce)
    if notificationType == true then
        notificationType = 5
    elseif notificationType == false then 
        notificationType = 6
    end
    
    -- 1/5/6/7/8/9/11/12 | 1warning/5success/6fail/7normal/8message/9win/11siance/12createmessage
    if announce then
        server.announce(G_ScriptName, text, targetID)
    else
        server.notify(targetID, G_ScriptName, text, notificationType)
    end

    BU_Debug("message displayed to user: "..tostring(targetID).."\nnotificationType: "..tostring(notificationType).."\nmessage: "..tostring(text))
end