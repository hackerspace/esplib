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
  d('wifi_client')
end

if wifi_ap == 1 then
  wifi.setmode(wifi.SOFTAP)
  d('ap')
end

CMDFILE = 'main.lua'
tmr.alarm(0, 3000, 0, function() dofile(CMDFILE) end )

print('/init.lua')
