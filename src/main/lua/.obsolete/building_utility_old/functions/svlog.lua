function svlog(message, sorce)
    sd1["logs"]["main"] = (sd1["logs"]["main"] or "")..gettime().."sorce: "..(sorce or "ERROR").."  |  log:"..(message or "ERROR").."\n"
end