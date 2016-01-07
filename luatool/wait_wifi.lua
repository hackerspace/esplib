isConnected = false
repeat
   -- Lets see if we are already connected by getting the IP
   ipAddr = wifi.sta.getip()
   if ( ( ipAddr ~= nil ) and  ( ipAddr ~= "0.0.0.0" ) )then  -- Check if IP is valid
      isConnected = true
   end

until ( isConnected == true )
