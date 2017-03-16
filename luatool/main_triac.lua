print('main.lua')

out(triac_pin)
lo(triac_pin)
out(r1)
out(r2)
out(r3)
hi(r1)
hi(r2)
hi(r3)

en = 0
speed = 10

function go()
  gpio.write(triac_pin, 1)
  gpio.write(triac_pin, 0)
  -- tmr.alarm(0, speed, 0, function() gpio.write(triac_pin, 0) end)
end

function sense()
  print('Sensing')
  gpio.mode(sense_pin, gpio.INPUT, gpio.PULLUP)
  gpio.trig(sense_pin, "high", function(l)
    -- print('Sensing disturbance in the force')
    if en == 1 then
      tmr.delay(speed)
      go()
    end
  end)
end

sense()


tmr.alarm(3, 1000, 0, function()
  print('Now what')
end)

print('/main.lua')
