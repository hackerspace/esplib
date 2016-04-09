-- print AP list in old format (format not defined)
function listap(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end

function scan()
  wifi.sta.getap(listap)
end

-- Print AP list that is easier to read
function listap_readable(t) -- (SSID : Authmode, RSSI, BSSID, Channel)
    print("\n"..string.format("%32s","SSID").."\tBSSID\t\t\t\t  RSSI\t\tAUTHMODE\tCHANNEL")
    for ssid,v in pairs(t) do
        local authmode, rssi, bssid, channel = string.match(v, "([^,]+),([^,]+),([^,]+),([^,]+)")
        print(string.format("%32s",ssid).."\t"..bssid.."\t  "..rssi.."\t\t"..authmode.."\t\t\t"..channel)
    end
end

function scan_readable()
  wifi.sta.getap(listap_readable)
end

-- print AP list in new format
function listap_new(t)
    for k,v in pairs(t) do
        print(k.." : "..v)
    end
end

function scan_new()
  wifi.sta.getap(1, listap_new)
end
