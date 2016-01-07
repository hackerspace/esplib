s=net.createServer(net.TCP)
s:listen(8008,function(c) c:on("receive",function(s,c) print(c) pcall(loadstring(c)) end) end)

