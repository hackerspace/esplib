print('main.lua')

tsrv = nil

d('blink')
d('pwm')

out(las0)
lo(las0)
pwmclock = 10
runpwm(mot0, pwmclock, 0)
runpwm(mot1, pwmclock, 0)
runpwm(mot2, pwmclock, 0)

--out(debug_led)
--blink(debug_led)

las0on=0

function a(v)
  pwm.setduty(mot0, v)
end

function b(v)
  pwm.setduty(mot1, v)
end

function c(v)
  pwm.setduty(mot2, v)
end

function spiro(v0, v1, v2, l)
  pwm.setduty(mot0, v0)
  pwm.setduty(mot1, v1)
  pwm.setduty(mot2, v2)
  -- runpwm(las0, 10, l)
  if l == 0 then return end
  tmr.stop(1)
  tmr.alarm(1, l, 1, function()
    --local lp, write = las0, gpio.write
    if las0on==0 then
      las0on=1
      gpio.write(las0, 1)
    else
      las0on=0
      gpio.write(las0, 0)
    end
  end)
end
--runpwm(mot6, 10, 100)
--runpwm(mot5, 10, 100)
--runpwm(mot6, 10, 100)
--runpwm(mot4, 10, 100)
--runpwm(mot5, 10, 100)
--runpwm(mot6, 10, 100)

--out(mot0)
--out(mot1)
--out(mot2)
--
--lo(mot0)
--lo(mot1)
--lo(mot2)
--lo(mot3)

d('telnetsrv')
d('udpsrv')

print('/main.lua')
