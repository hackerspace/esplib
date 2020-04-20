print("Waiting for wifi IP address")
tmr.alarm(0,500,1,function()
  ipAddr = wifi.sta.getip()
  if (ipAddr ~= nil and ipAddr ~= "0.0.0.0") then
    tmr.stop(0)
    print("\nGot IP, starting main")
    print("IP: " .. ipAddr)
    d('main')
  else
    uart.write(0, ".")
  end
end)
