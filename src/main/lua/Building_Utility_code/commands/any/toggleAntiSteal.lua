--- toggles antisteal for the user
-- @param data
-- @return nil
function antiSteal(data)
    local user = data.user
    user.antiSteal = not user.antiSteal
    user:updateVehiclesAntiSteal()
    user:display("AntiSteal "..booleanTranslator(user.antiSteal, 1), user.antiSteal)
end