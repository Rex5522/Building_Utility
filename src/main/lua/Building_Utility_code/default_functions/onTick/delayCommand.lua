function delayCommand(commandToDelay, ticksToDelayFor, ...) -- DO NOT ASSUME THINGS ARE DONE JUST CAUSE YOU PUT THEM HERE.
    local args = {...}
    if commandToDelay and ticksToDelayFor then
        BU_Debug(commandToDelay)
        table.insert(G_Misc.delayedCommands, {
            delayTicksLeft = ticksToDelayFor,
            functionToDelay = commandToDelay,
            args = args
        })
        return
    end

    if tableLength(G_Misc.delayedCommands) > 100 then
        BU_Debug("CIRTICAL WARNING: delayCommand anti-cascade measures triggered")
        G_Misc.delayedCommands = {}
    end

    for index = #G_Misc.delayedCommands, 1, -1 do
        local commandData = G_Misc.delayedCommands[index]

        commandData.delayTicksLeft = commandData.delayTicksLeft - 1
        if commandData.delayTicksLeft == 0 then

            if type(commandData.functionToDelay) == "function" then
                BU_Debug("running delayed function",commandData.functionToDelay(table.unpack(commandData.args)))
            else
                BU_Debug("a value was not a function")
            end
            table.remove(G_Misc.delayedCommands, index)
        end
    end
end