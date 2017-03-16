blink_on=0


function toggle(pin)
  if blink_on==0 then
    blink_on=1
    gpio.write(pin, gpio.HIGH)
  else
    blink_on=0
    gpio.write(pin, gpio.LOW)
  end
end

function blink(pin)
    tmr.alarm(1, 1000, 1, function()
      toggle(pin)
    end)
end
