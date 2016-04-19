print('main.lua')
print('Doorbell 0.1')

gpio.mode(sense_pin, gpio.INPUT)

notify_tcp = 0

function notify()
  print('Notify')
  print('Gpio:'..gpio.read(sense_pin))

  if notify_tcp then
    conn = net.createConnection(net.TCP, 0)
    conn:connect(12345, '172.17.4.70')
    conn:on("connection", function(sck, c) 
      print('Connected, sending message')
      sck:send('base;robotour09;doorbell slackers\n')
      sck:close()
      end)
  end
  print('/Notify')
end

--d('telnetsrv')
d('bridge')

tmr.alarm(0, 500, 1, function()
  if gpio.read(sense_pin) == 1 then
    notify()
  end
end)


tmr.alarm(6, 1000, 0, function()
  print('Now what')
end)

print('/main.lua')
