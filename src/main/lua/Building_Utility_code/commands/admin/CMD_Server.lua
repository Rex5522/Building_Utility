function CMD_Server(data)
    local formatCommandData = {
        command = "?server",
        argData = {
            [1] = {
                argName = "name_of_server_setting",
                Description = "the id of the object you wish to spawn. use ?spawnanimal list to list object ids. type ?server list for a list",
                exampleValue = "workshop",
                required = true
            },

            [2] = {
                argName = "value_to_set",
                Description = "the value you want to set the server setting to",
                exampleValue = "false",
                required = true
            }
        }
    }

    local user = data.user
    local targetSettingName = data.arg1
    local valueToSetSetting = data.arg2

    if not targetSettingName or targetSettingName == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    if targetSettingName == "list" then
        local text = "NameOfSetting / Prefix : CurrentValue\n"

        for nameOfSettingLoop, valueOfSetting in pairs(G_ServerSettings) do
            if type(valueToSetSetting) ~= "table" then
                text = text .. string.format("%s / %s : %s\n",
                tostring(nameOfSettingLoop), G_ServerSettings.prefixes.findPreifxFromSetting[nameOfSettingLoop], tostring(valueOfSetting))
            end
        end

        user:display(text, true, true)
        return
    end

    local settingRefrence
    local actualSettingName
    for settingName, _ in pairs(G_ServerSettings) do
        if settingName:lower() == targetSettingName then
            settingRefrence = settingName
            actualSettingName = tostring(settingName)
            break
        end

        if settingName == G_ServerSettings.prefixes.findSettingFromPrefix[targetSettingName] then
            settingRefrence = settingName
            actualSettingName = tostring(settingName)
            break
        end
    end

    if settingRefrence == nil then
        user:display("The setting '" .. targetSettingName .. "' does not exist. Use '?server list' to view all settings.")
        return
    end

    if not valueToSetSetting then
        user:display("no value for setting provided")
        return
    end

    valueToSetSetting = stringToValue(valueToSetSetting)
    if valueToSetSetting == nil or type(G_ServerSettings[settingRefrence]) ~= type(valueToSetSetting) then
        user:display("invalied type for option. required type is " .. type(settingRefrence))
        return
    end

    local text = string.format("setting %s changed from %s to %s",
    actualSettingName, tostring(G_ServerSettings[actualSettingName]), tostring(valueToSetSetting))
    G_ServerSettings[actualSettingName] = valueToSetSetting

    user:display(text, true)

end