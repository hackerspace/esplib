gpio.mode(sense_pin, gpio.INT)
skip = true
gpio.trig(sense_pin, "high", function(l)
  --print('s'..l)
  --tmr.alarm(5, sense_delay, 0, function()
  --tmr.alarm(5, 1, 0, function()
  tmr.delay(1000)
    --toggle(debug_led_pin)
   -- if skip then
   --  skip = false
   -- else
     triac_pulse()
   --  skip = true
    --end
    --print("lal")
  --end)
end)
