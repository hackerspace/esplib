print('init.lua')

dofile('config.lua')
dofile('pins.lua')

uart.setup(0, uart_baud, 8, 0, 1)

function d(f)
  dofile(f..'.lua')
end

function res()
  node.restart()
end

function ip()
  print(wifi.sta.getip())
end

function apip()
  print(wifi.ap.getip())
end

if wifi_sta == 1 then
  wifi.setmode(wifi.STATION)

  print('set mode=STATION (mode='..wifi.getmode()..')')
  print('MAC: ', wifi.sta.getmac())
  print('chip: ', node.chipid())
  print('heap: ', node.heap())

  wifi.sta.config(wifi_ssid, wifi_pass)
end

if wifi_ap == 1 then
  wifi.setmode(wifi.SOFTAP)
  d('ap')
end

CMDFILE = 'main.lua'
tmr.alarm(0, 3000, 0, function() dofile(CMDFILE) end )

print('/init.lua')
