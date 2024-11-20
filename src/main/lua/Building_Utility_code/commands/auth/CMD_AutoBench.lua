function CMD_AutoBench(data)
    local user = data.user
    user.autoBench = not user.autoBench
    user:display("AutoBench "..booleanTranslator(user.autoBench, 1), user.autoBench)
end