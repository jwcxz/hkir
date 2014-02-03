#
# AVR Project Makefile
# build configuration for this project
# jwc :: jwcxz.com
#

D_ROOT=../..
D_PROJ=.

PROJECT_NAME=hkir

# project source files
S_SRC=main.c

# module source files
S_SRC+=ir.c uart_rb.c uart.c


# AVR part hardware options
AVR_LFUSE=0xce
AVR_HFUSE=0xdf
AVR_EFUSE=0xf8


CFLAGS+=$(addprefix -D,$(DEF))

include $(D_ROOT)/bld/Makefile.in
