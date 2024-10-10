function tablemaker(create, table, keys)
    -- create var means if true then make the table if it doesint 
    if table == nil or keys == nil then 
        debug("cannot make a table with no starting char or no table")
        return false
    end

    len = tablelen(keys)
    debug("key len: "..len)
    for i=1,len do
        if keys[i] == nil and i<len and not create then 
            debug("returned false cause missing data: "..i.." - "..len) 
            return false 
        end
    end


    ctable = table
    if create then
        for i=1,len do
            debug("scan loop i: "..i)
            if ctable[keys[i]] == nil then
                debug("scan loop bad i: "..i)
                return false
            end
            ctable = ctable[keys[i]]
        end
        debug("returned true")
        return ctable
        -- for i=1,len do
        --     if ctable[keys[i]] == nil then
        --         ctable[i]={}
        --     end
        --     ctable = ctable[keys[i]]
        -- end
        -- return ctable

    else

        for i=1,len do
            debug("scan loop i: "..i)
            if ctable[keys[i]] == nil then
                debug("scan loop bad i: "..i)
                return false
            end
            ctable = ctable[keys[i]]
        end
        debug("returned true")
        return true

    end
    return true
end