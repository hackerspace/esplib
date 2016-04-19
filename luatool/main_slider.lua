print('main.lua')

d('telnetsrv')

gpio.mode(dir_pin, gpio.OUTPUT)
gpio.mode(step_pin, gpio.OUTPUT)
gpio.mode(enable_pin, gpio.OUTPUT)

gpio.mode(trig_pin, gpio.OUTPUT)
gpio.mode(focus_pin, gpio.OUTPUT)
-- d('sense')
-- d('bridge')
-- d('blink')
--
gpio.write(enable_pin, 0)
-- d('pwm')
--
--

function trig()
   gpio.write(trig_pin, 1)
   tmr.delay(100000)
   gpio.write(trig_pin, 0)
end

function go_cap()
   gpio.write(step_pin, 1)
   gpio.write(step_pin, 0)
   tmr.alarm(2, 1000, 1, function() trig() end)
end
--
tmr.alarm(1, 2000, 1, function() go_cap() end)


-- out(debug_led_pin)
-- blink(debug_led_pin)

function sense()
  print('Sensing')
  d('sense')
end

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)


print('/main.lua')
