trig_pin = 0
gpio.mode(trig_pin, gpio.INT)
gpio.trig(trig_pin, "down", function(l) print("level="..l) end)
