local pin = 4    --> GPIO2

function debounced_trigger(pin, onchange_function, dwell)
  local start, last_event = tmr.now()
  local times = {}  -- collect trigger time offsets +/- = high/low
  local function trigger_cb(event)
    last_event = event
    if (last_even == nil) then tmr.alarm(6, dwell, 0, function()
        onchange_function(pin, last_event, times)
      end)
    end
    local delta = tmr.now() - start
    times[#times+1] = (event == gpio.HIGH) and delta or -delta
  end
  gpio.trig(pin, 'both', trigger_cb)
end

function onChange (pin, last_event, times)
    ('The pin value has changed to %d with last event %d after these contacts: %s'):format(
       gpio.read(pin), last_event, table.concat(times, ', '))
end

debounced_trigger(pin, onChange, 1000)
gpio.mode(pin, gpio.INT, gpio.PULLUP)

