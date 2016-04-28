BAUD=115200
DEVICE=/dev/ttyUSB0

FILE_LIST = \
	    ap.lua \
	    apclient.lua \
	    debounce.lua \
	    debounce2.lua \
	    init.lua \
	    int.lua \
	    blink.lua \
	    bridge.lua \
	    config.lua \
	    main.lua \
	    check.lua \
	    pins.lua \
	    pwm.lua \
	    signal.lua \
	    sense.lua \
	    sntp.lua \
	    wifi_scan.lua \
	    wifi_mon.lua \
	    wifi_client.lua \
	    telnetsrv.lua \

CMD=./luatool.py -b $(BAUD) -p $(DEVICE) -f

CLIST=$(FILE_LIST:.lua=.luac)
# CLIST=$(FILE_LIST)
# $(FILE_LIST)

$(CLIST):
	$(CMD) `echo $@ | sed 's/.luac/.lua/'`

killminiterm:
	-/usr/bin/pkill -f 'miniterm.py $(DEVICE)'

#all: .init.luac
all: killminiterm $(CLIST)
# all
slider: 
	$(CMD) main_slider.lua -t main.lua
	$(CMD) pins_slider.lua -t pins.lua

doorbel:
	$(CMD) main_doorbel.lua -t main.lua
	$(CMD) pins_doorbel.lua -t pins.lua

lights:
	$(CMD) main_lights.lua -t main.lua
	$(CMD) pins_lights.lua -t pins.lua

gps:
	$(CMD) main_gps.lua -t main.lua
	$(CMD) config_gps.lua -t config.lua
#	$(CMD) pins_gps.lua -t pins.lua
