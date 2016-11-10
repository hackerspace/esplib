print('main.lua')

d('telnetsrv')
d('udpsrv')
d('blink')
out(debug_led)
blink(debug_led)

ws2812.init()
function scale(x, in_min, in_max, out_min, out_max)
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end

buf = ws2812.newBuffer(led_count + 1, 3);
--b:fill(0, 0, 0);
function go(r, g, b)
  for i=1,led_count do
        buf:set(i, g, r, b)
  end
  buf:write(0)
end

r = 0
g = 0
b = 0
t = 300
function flip()
  if r == 0 then
    r = 255
    g = 0
  else
    r = 0
    g = 255
  end
  go(r, g, 0)
end

tmr.alarm(1, t, 1, flip)

way = 0
step = 10

tmr.alarm(2, 500, 1, function()
  if t <= 100 then way = 1 end
  if t >= 500 then way = 0 end
  if way == 0 then
    t = t - step
  else
    t = t + step
  end
  tmr.alarm(1, t, 1, flip)
end)

-- go(0, 255, 0)
print('/main.lua')
