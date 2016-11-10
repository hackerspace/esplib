print('main.lua')

print('wait wifi')
--d('wait_wifi')
print('/wait wifi')

d('telnetsrv')

d('blink')
-- out(out1)
-- out(out2)
out(debug_led)
blink(debug_led)

ws2812.init()
d('wifi_ws2812')

print('/main.lua')
