--- logs a message to buildNet and to any users with debug enabled
-- @param message, the message to log
-- @param where, a value that auto filled in from the compiler
-- @return message logged
function BU_Debug(fileFromDebug, ...) -- BU_ to avoid lua default var clash
    local debugMessages = {...}
    local debugMessage = ""
    local commands = {}
    for index, debugData in ipairs(debugMessages) do
        if type(debugData) == "table" then
            debugMessage = debugMessage..debugTable(debugData)
        else
            if debugMessages == "string" and index == 1 then
                local debug_commands = string.match(debugData, "!DEBUG:(.-)!")
                if debug_commands then
                    for command in string.gmatch(debug_commands, "([^:]+)") do
                        commands[command] = true
                    end
                end
            end
            debugMessage = debugMessage..tostring(debugData).."\n"
        end
    end


    fileFromDebug = fileFromDebug or "ERROR"
    if debugMessage == nil  then
        debugMessage = "ERROR"
    end



    debugInfo = string.format(
        "[T:%d] %s:\n%s",
        G_Tick or -1, fileFromDebug, debugMessage
    )

    if not commands["NONET"] then
        local buildNet = getBuildNet()
        buildNet:sendMessage(debugInfo.."\n")
    end

    if g_savedata.users == nil or G_DebugMode then
        server.announce("BU-BACKUP-DEBUGGER", debugInfo, -1)
    else
        for _, user in pairs(g_savedata.users) do
            if user.debug == true then
                server.announce(G_ScriptName.."-Debugger", debugInfo, user.ID)
            end
        end
    end

    return debugInfo
end