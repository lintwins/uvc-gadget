CROSS_COMPILE	=$(arm-arago-linux-gnueabi-)
ARCH		= $(arm)
KERNEL_DIR	= $(/home/zjl/data/polycom/ipnc_rdk_3_5/Source/ti_tools/ipnc_psp_arago/kernel) #/usr/src/linux

CC		:= $(CROSS_COMPILE)gcc
KERNEL_INCLUDE	:= -I$(KERNEL_DIR)/include -I$(KERNEL_DIR)/arch/$(ARCH)/include
CFLAGS		:= -W -Wall -g $(KERNEL_INCLUDE)
LDFLAGS		:= -g

all: uvc-gadget

uvc-gadget: uvc-gadget.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o
	rm -f uvc-gadget
