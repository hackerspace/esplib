print('init.lua')

uart.setup(0, 115200, 8, 0, 1)

dofile('pins.lua')

function d(f)
  dofile(f..'.lua')
end

function res()
  node.restart()
end

wifi.setmode(wifi.STATION)

print('set mode=STATION (mode='..wifi.getmode()..')')
print('MAC: ',wifi.sta.getmac())
print('chip: ',node.chipid())
print('heap: ',node.heap())

-- wifi config start
wifi.sta.config("SSID","MasterPassword")
-- wifi config end

CMDFILE = 'main.lua'
tmr.alarm(0, 3000, 0, function() dofile(CMDFILE) end )

print('/init.lua')
