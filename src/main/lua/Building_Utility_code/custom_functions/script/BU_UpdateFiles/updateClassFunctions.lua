function updateClassFunctionsAndFix(tableOfObjects, upToDateFunctions, fakeObjectToCompare)
    for index, classObject in pairs(tableOfObjects) do
        -- remove old commands that not longer exist
        for dataName, data in pairs(classObject) do
            if type(data) == "function" and not upToDateFunctions[dataName] then
                classObject[dataName] = nil
            end
        end

        -- add or update commands
        for name, func in pairs(upToDateFunctions) do
            classObject[name] = function(...) return func(classObject, ...) end
        end

        -- fix file if available
        if fakeObjectToCompare then
            compareTables(fakeObjectToCompare, classObject, true)
        end
    end
end