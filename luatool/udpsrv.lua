udpsrv = net.createServer(net.UDP)
udpsrv:on("receive", function(c, l)
  -- print(l)
  node.input(l)           -- works like pcall(loadstring(l)) but support multiple separate line
end)
udpsrv:listen(2333)
