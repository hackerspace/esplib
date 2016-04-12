BAUD=115200
DEVICE=/dev/ttyUSB0

FILE_LIST = \
	    ap.lua \
	    apclient.lua \
	    init.lua \
	    blink.lua \
	    bridge.lua \
	    config.lua \
	    main.lua \
	    telnetsrv.lua \
	    check.lua \
	    pins.lua \
	    pwm.lua \
	    sense.lua \
	    telnetsrv.lua \
	    wifi_scan.lua \
	    wifi_mon.lua \

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
