s=net.createServer(net.TCP)
s:listen(80,function(c) c:on("receive",function(s,c) print(c) end) end)
