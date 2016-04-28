print('main.lua')

tsrv = nil

gpio.mode(out1, gpio.OUTPUT)
gpio.mode(out2, gpio.OUTPUT)
-- gpio.mode(in1, gpio.INT, gpio.PULLUP)

d('debounce')


on = 0

function toggle_lights()
  if on==0 then
    on=1
    gpio.write(out1, gpio.HIGH)
    gpio.write(out2, gpio.HIGH)
  else
    on=0
    gpio.write(out1, gpio.LOW)
    gpio.write(out2, gpio.LOW)
  end
end

gpio.mode(in1, gpio.INT, gpio.PULLUP)
gpio.trig(in1, 'both', debounce(toggle_lights))

--gpio.trig(in1, "down", function(l) toggle_lights() end)

d('telnetsrv')

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)

print('/main.lua')
