print('main.lua')

d('telnetsrv')
d('stepper')

stepper_enable()

tmr.alarm(0, 1000, 0, function()
  print('Now what')
end)


function runclock(p)
  period_ms = p
  timestamp = 0
  last_timestamp = 0
  tmr.alarm(6, period_ms, 1, function()
    timestamp = timestamp + 1
  end)
end

function runstep(p)
  tmr.alarm(0, p, 1, function()
    if timestamp > last_timestamp then
      step()
      last_timestamp = timestamp
    end
  end)
end

runclock(1)
runstep(10)

print('/main.lua')
