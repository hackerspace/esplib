-- pin 1:12 IO index
-- clock 1:1000, pwm frequency
-- duty 0:1023
function runpwm(pin, clock, duty)
  pwm.setup(pin, clock, duty)
  pwm.start(pin)
end

-- runpwm
runpwm(step_pin, 100, 500)
