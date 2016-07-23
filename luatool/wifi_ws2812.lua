tmr.alarm(0, 500, 1,function() ws2812.write(0, string.char(0, (wifi.sta.getrssi() + 100)*6, 0):rep(16)) end)

local i = 0; b = ws2812.newBuffer(16, 3); b:fill(255, 255, 0); tmr.alarm(0, 50, 1, function()
        i=i+1
        b:fade(2)
        b:set(i%b:size(), 255, 0, 0)
        b:write(0)
end)
