print('main.lua')

d('telnetsrv')
d('udpsrv')
d('blink')
out(debug_led)
blink(debug_led)

max_led_count = led_count
print(max_led_count)

ws2812.init()
function scale(x, in_min, in_max, out_min, out_max)
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end

buf = ws2812.newBuffer(max_led_count + 1, 3);
r = 0
g = 0
b = 0

function setr(val)
  r = val
  update()
end

function setg(val)
  g = val
  update()
end

function setb(val)
  b = val
  update()
end

function update()
  for i=1,led_count do
        buf:set(i, g, r, b)
  end
  for i=led_count+1,max_led_count-1 do
        buf:set(i, 0, 0, 0)
  end
  ws2812:write(0)
end

function go(nled_count)
  led_count = nled_count
  update()
end

setr(255)
go(240)
print('/main.lua')
