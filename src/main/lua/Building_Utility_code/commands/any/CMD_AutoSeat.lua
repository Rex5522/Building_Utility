--- toggles autoseat for thge user
-- @param data
-- @return nil
function CMD_AutoSeat(data)
    local user = data.user
    user.autoSeat = not user.autoSeat
    user:display("AutoSeat "..booleanTranslator(user.autoSeat, 1), true)
end