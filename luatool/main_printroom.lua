print('main.lua')

tsrv = nil

d('blink')
d('telnetsrv')
d('ws2812')

out(debug_led)
blink(debug_led)

--solidWhite()
solidRGB(200, 100, 100)

on = lo
off = hi

fan = rel1
taz = rel2
i2 = rel3
rpi = rel4

out(rel1)
out(rel2)
out(rel3)
out(rel4)

function all_on()
  on(rel1)
  on(rel2)
  on(rel3)
  on(rel4)
end

function all_off()
  off(rel1)
  off(rel2)
  off(rel3)
  off(rel4)
end

function default()
  off(fan)
  on(taz)
  on(i2)
  on(rpi)
end

default()

print('/main.lua')
