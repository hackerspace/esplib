ws2812.init()

function solidRGBC(r, g, b, c)
  ws_str = string.char(g, r, b)
  ws2812.write(ws_str:rep(c))
end

function solidRGB(r, g, b)
  solidRGBC(r, g, b, led_count)
end

function solidRed()
  solidRGB(255, 0, 0)
end

function solidGreen()
  solidRGB(0, 255, 0)
end

function solidBlue()
  solidRGB(0, 0, 255)
end

function solidYellow()
  solidRGB(255, 255, 0)
end

function solidWhite()
  solidRGB(255, 255, 255)
end


wson=0

function toggleOne()
  if wson==0 then
    wson=1
    solidRGBC(0, 255, 0, 1)
  else
    wson=0
    solidRGBC(255, 0, 0, 1)
  end
end
