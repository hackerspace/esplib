print('init.lua')

dofile('config.lua')
dofile('pins.lua')

uart.setup(0, uart_baud, 8, 0, 1)
node.setcpufreq(node_cpu)

function d(f)
  dofile(f..'.lua')
end

function abort()
  tmr.stop(0)
end

a = abort

function res()
  node.restart()
end

function ip()
  print(wifi.sta.getip())
end

function apip()
  print(wifi.ap.getip())
end

if wifi_disable == 1 then
  wifi.setmode(wifi.NULLMODE)
else
  wifi.setphymode(wifi_mode)
  if wifi_stationap == 1 then
    wifi.setmode(wifi.STATIONAP)
    d('wifi_client')
    d('ap')
  elseif wifi_sta == 1 then
    wifi.setmode(wifi.STATION)
    d('wifi_client')
  elseif wifi_ap == 1 then
    wifi.setmode(wifi.SOFTAP)
    d('ap')
  end
end

CMDFILE = 'main.lua'
tmr.alarm(0, 3000, 0, function() dofile(CMDFILE) end )

print('/init.lua')
