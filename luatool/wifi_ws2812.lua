--tmr.alarm(0, 100, 1,function()
--  c = string.char(100, 100, 0):rep(50)
--  ws2812.write(c)
--  i = wifi.sta.getrssi()
--  c = string.char(0, 200, 0):rep(i/-2)
--  ws2812.write(c) end)

function scale(x, in_min, in_max, out_min, out_max)
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end

rssimin = 100
rssimax = 0
leds = 16

local b = ws2812.newBuffer(leds + 10, 3); b:fill(0, 0, 0); tmr.alarm(0, 1000, 1, function()
  rssi = wifi.sta.getrssi() * -1
  if rssi > rssimax then rssimax = rssi end
  if rssi < rssimin then rssimin = rssi end

  rssi = scale(rssi, rssimin, rssimax, 0, leds)

  for i=1,leds do
    if rssi < i then
      b:set(i, 255, 0, 0)
    else
      b:set(i, 0, 255, 0)
    end
    b:write(0)
  end
end)
