print('main.lua')

d('telnetsrv')
-- d('sense')
-- d('bridge')
d('blink')
d('pwm')

out(debug_led_pin)
blink(debug_led_pin)

function sense()
  print('Sensing')
  d('sense')
end

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)


print('/main.lua')
