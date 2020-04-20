debounce_pin = user_sw

function debounce (func)
    local last = 0
    local delay = 100000

    return function (...)
        local now = tmr.now()
        local delta = now - last
        -- if delta < 0 then delta = delta + 2147483647 end; proposed because of delta rolling over
        if delta < delay then return end;

        last = now
        return func(...)
    end
end

function onChange ()
    print('The pin value has changed to '..gpio.read(debounce_pin))
end

-- example:
-- gpio.mode(debounce_pin, gpio.INT, gpio.PULLUP)
-- gpio.trig(debounce_pin, 'both', debounce(onChange))
