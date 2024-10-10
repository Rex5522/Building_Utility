function remove_sub(tableToUse, typeOfItem, nameOfItem, user)
    if tableToUse[nameOfItem] then
        tableToUse[nameOfItem] = nil
        user:display(typeOfItem.." \""..nameOfItem.."\" deleted")
    else
        user:display(typeOfItem.." \""..nameOfItem.."\" does not exist")
    end
end