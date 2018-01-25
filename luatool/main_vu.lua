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
  ws2812.write(buf)
end

function go(nr, ng, nb)
  r = nr
  g = ng
  b = nb
  update()
end

go(0, 255, 0)
print('/main.lua')
