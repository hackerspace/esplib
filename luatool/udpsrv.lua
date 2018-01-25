udpsock = net.createUDPSocket()
udpsock:on("receive", function(s, data, port, ip)
  node.input(data) -- works like pcall(loadstring(l)) but support multiple separate line
end)
udpsock:listen(2333)
