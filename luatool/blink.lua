on=0

function out(pin)
  gpio.mode(pin, gpio.OUTPUT)
end

function toggle(pin)
  if on==0 then
    on=1
    gpio.write(pin, gpio.HIGH)
  else
    on=0
    gpio.write(pin, gpio.LOW)
  end
end

function blink(pin)
    tmr.alarm(1, 1000, 1, function()
      toggle(pin)
    end)
end
