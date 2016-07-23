print('main.lua')

d('bridge')

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)

print('/main.lua')
