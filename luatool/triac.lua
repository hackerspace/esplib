-- triac_pin = 2 -- GPIO4

gpio.mode(triac_pin, gpio.OUTPUT)
gpio.write(triac_pin, gpio.HIGH)

function triac_on()
  gpio.write(triac_pin, gpio.HIGH)
end

function triac_off()
  gpio.write(triac_pin, gpio.LOW)
end

function triac_pulse()
  gpio.write(triac_pin, gpio.LOW)
  gpio.write(triac_pin, gpio.HIGH)
end

function triac_periodic(interval)
  tmr.stop(6)
  tmr.alarm(6, interval, 1, function() triac_pulse() end)
end
