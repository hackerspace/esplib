--register callback
wifi.sta.eventMonReg(wifi.STA_IDLE, function() print("STATION_IDLE") end)
wifi.sta.eventMonReg(wifi.STA_CONNECTING, function() print("STATION_CONNECTING") end)
wifi.sta.eventMonReg(wifi.STA_WRONGPWD, function() print("STATION_WRONG_PASSWORD") end)
wifi.sta.eventMonReg(wifi.STA_APNOTFOUND, function() print("STATION_NO_AP_FOUND") end)
wifi.sta.eventMonReg(wifi.STA_FAIL, function() print("STATION_CONNECT_FAIL") end)
wifi.sta.eventMonReg(wifi.STA_GOTIP, function() print("STATION_GOT_IP") end)

wifi.sta.eventMonStart()

--register callback: use previous state
--wifi.sta.eventMonReg(wifi.STA_CONNECTING, function(previous_State)
--    if(previous_State==wifi.STA_GOTIP) then 
--        print("Station lost connection with access point\n\tAttempting to reconnect...")
--    else
--        print("STATION_CONNECTING")
--    end
--end)
--
----unregister callback
--wifi.sta.eventMonReg(wifi.STA_IDLE)
