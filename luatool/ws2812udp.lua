udpsock = net.createUDPSocket()
udpsock:on("receive", function(s, data, port, ip)
  ws2812.write(string.sub (data, 0, led_count * 3))
end)
udpsock:listen(2812)