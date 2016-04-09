-- print access point clients

for mac,ip in pairs(wifi.ap.getclient()) do
    print(mac,ip)
end
