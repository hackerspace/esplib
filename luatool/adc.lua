--if adc.force_init_mode(adc.INIT_VDD33)
if adc.force_init_mode(adc.INIT_ADC)
then
  node.restart()
  return -- don't bother continuing, the restart is scheduled
end

print("ADC: ", adc.read(0))
print("System voltage (mV): ", adc.readvdd33(0))
