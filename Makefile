######################################################################
#  Top Level: STM32F103C8T6 Projects
######################################################################

.PHONY = libopencm3 clobber_libopencm3 clean_libopencm3

all:	libopencm3
	$(MAKE) -$(MAKEFLAGS) -C ./src 

clean:	clean_libopencm3
	$(MAKE) -$(MAKEFLAGS) -C ./src clean

clobber: clobber_libopencm3
	$(MAKE) -$(MAKEFLAGS) -C ./src clobber

clean_libopencm3: clobber_libopencm3

clobber_libopencm3:
	rm -f libopencm3/lib/libopencm3_stm32f1.a
	-$(MAKE) -$(MAKEFLAGS) -C ./libopencm3 clean

libopencm3: libopencm3/lib/libopencm3_stm32f1.a

libopencm3/lib/libopencm3_stm32f1.a:
	$(MAKE) -C libopencm3 TARGETS=stm32/f1

# Uncomment if necessary:
# MAKE	= gmake

# End