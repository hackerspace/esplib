print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ', wifi.sta.getmac())
print('chip: ', node.chipid())
print('heap: ', node.heap())

wifi.sta.config(wifi_ssid, wifi_pass)
