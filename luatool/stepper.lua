-- stepper.lua
-- inspired by http://www.esp8266.com/viewtopic.php?f=19&t=2326

-- simple stepper driver for controlling a stepper motor with a
-- drv8825 driver

step_delay = 20 -- choose speed
step_state = 0 -- updated by step_take-function
step_direction = 1 -- choose step direction -1, 1
step_stepsleft = 0 -- number of steps to move, will de decremented
step_timerid = 4 -- which timer to use for the steps

gpio.mode(dir_pin, gpio.OUTPUT)
gpio.mode(step_pin, gpio.OUTPUT)
gpio.mode(enable_pin, gpio.OUTPUT)

function stepper_enable()
  gpio.write(enable_pin, 0)
end

function stepper_disable()
  gpio.write(enable_pin, 1)
end

function step()
  gpio.write(step_pin, 1)
  gpio.write(step_pin, 0)
end

function stepper_run()
  step()

  step_stepsleft = step_stepsleft - 1
  if step_stepsleft > 0 then
    tmr.alarm(step_timerid, step_delay, 0, stepper_run )
  else
    print("Done\n")
    print(timestamp)
    print("\n")
  end
end

function stepper_move(steps, direction, delay)
  tmr.stop(step_timerid)
  step_stepsleft = steps
  step_direction = direction
  step_delay = delay
  stepper_run()
end

function stepper_stop()
  tmr.stop(step_timerid)
  step_stepsleft = 0
end
