gpio.mode(int_pin, gpio.INT)
gpio.trig(int_pin, "down", function(l) print("level="..l) end)
