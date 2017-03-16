print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ', wifi.sta.getmac())
print('chip: ', node.chipid())
print('heap: ', node.heap())
print('hostname: ', hostname)

wifi.sta.sethostname(hostname)
wifi.sta.config(wifi_ssid, wifi_pass)
-- FIXME: check if supported
-- wifi.sta.sleeptype(wifi_sleep_type)
