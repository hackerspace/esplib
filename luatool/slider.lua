sock = net.createServer(net.TCP)

sock:listen(6666, function(c)
  c:on("receive", function(sock, input)
    uart.write(0, input)
    sock:send("ok\r")
  end)
end)
