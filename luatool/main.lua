print('main.lua')

d('telnetsrv')
d('blink')
d('triac')

out(debug_led_pin)
--out(triac)
blink(debug_led_pin)
telnetsrv()

function sense()
  print('Sensing')
  d('sense')
end

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)


print('/main.lua')
