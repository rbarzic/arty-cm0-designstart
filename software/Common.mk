# Strongly inspired by the Makefile provided in the DesignStart Cortex-M0 kit
# GCC only

CPU_PRODUCT = CORTEX_M0

# Shared software directory
SOFTWARE_DIR ?= $(DESIGNSTART_TOP)/software
CMSIS_DIR    = $(SOFTWARE_DIR)/cmsis
CORE_DIR     = $(CMSIS_DIR)/CMSIS/Include

DEVICE_DIR   = $(CMSIS_DIR)/Device/ARM/CMSDK_CM0

# Program file
#TESTNAME     = hello

# Endian Option
COMPILE_BIGEND = 0

# Configuration
USER_DEFINE    = -DCORTEX_M0

DEPS_LIST       = Makefile

# Tool chain : ds5 / gcc / keil
TOOL_CHAIN      ?= gcc

ifeq ($(TOOL_CHAIN),gcc)
  CPU_TYPE        = -mcpu=cortex-m0
endif

# Startup code directory for gcc
ifeq ($(TOOL_CHAIN),gcc)
 STARTUP_DIR  = $(DEVICE_DIR)/Source/GCC
endif

STARTUP_FILE = startup_CMSDK_CM0
SYSTEM_FILE  = system_CMSDK_CM0



GNG_CC      = arm-none-eabi-gcc
GNU_OBJDUMP = arm-none-eabi-objdump
GNU_OBJCOPY = arm-none-eabi-objcopy

LINKER_SCRIPT_PATH = ../scripts
LINKER_SCRIPT = $(LINKER_SCRIPT_PATH)/cmsdk_cm0.ld

GNU_CC_FLAGS = -g -O3 -mthumb $(CPU_TYPE) -std=c99
GNU_CC_FLAGS += -D__STARTUP_CLEAR_BSS=1

ifeq ($(COMPILE_BIGEND),1)
 # Big Endian
 GNU_CC_FLAGS   += -mbig-endian
endif

# ---------------------------------------------------------------------------------------
all: all_$(TOOL_CHAIN)

all_gcc:
	$(GNG_CC) $(GNU_CC_FLAGS) $(STARTUP_DIR)/$(STARTUP_FILE).s \
		$(SOURCES) \
		$(SOFTWARE_DIR)/common/retarget/retarget.c \
		$(SOFTWARE_DIR)/common/retarget/uart_stdout.c \
		$(DEVICE_DIR)/Source/$(SYSTEM_FILE).c \
		-I $(DEVICE_DIR)/Include -I $(CORE_DIR) \
                -I $(SOFTWARE_DIR)/common/retarget  \
		-L $(LINKER_SCRIPT_PATH) \
		-D__STACK_SIZE=0x200 \
		-D__HEAP_SIZE=0x1000 \
		$(USER_DEFINE) -T $(LINKER_SCRIPT) -o $(TESTNAME).elf
	# Generate disassembly code
	$(GNU_OBJDUMP) -S $(TESTNAME).elf > $(TESTNAME).lst
	# Generate binary file
	$(GNU_OBJCOPY) -S $(TESTNAME).elf -O binary $(TESTNAME).bin
	# Generate hex file
	$(GNU_OBJCOPY) -S $(TESTNAME).elf -O verilog $(TESTNAME).hex
	# Suitable for Verilog simulator
	hexdump -v -e ' 1/4 "%08x " "\n"' $(TESTNAME).bin > $(TESTNAME).vmem32 # Xilinx
	hexdump -v -e '"@%08.8_ax  " 1/1 "%02x " "\n"' $(TESTNAME).bin > $(TESTNAME).vmem # iverilog
# Note:
# If the version of object copy you are using does not support verilog hex file output,
# you can generate the hex file from binary file using the following command
#       od -v -A n -t x1 --width=1  $(TESTNAME).bin > $(TESTNAME).hex

# Binary

all_bin: $(TESTNAME).bin
	# Generate hex file from binary
	od -v -A n -t x1 --width=1  $(TESTNAME).bin > $(TESTNAME).hex


# Simulation support

wave:
	gtkwave tb_cmsdk_mcu.vcd &
comp:
	make -C $(TOP)/sim comp

run:
	vvp $(TOP)/sim/tb  +program_memory=$(TESTNAME).vmem

# ---------------------------------------------------------------------------------------
# Clean
clean :
	@rm -rf *.o
	@if [ -e $(TESTNAME).hex ] ; then \
	  rm -rf $(TESTNAME).hex ; \
	fi
	@if [ -e $(TESTNAME).lst ] ; then \
	  rm -rf $(TESTNAME).lst ; \
	fi
	@if [ -e $(TESTNAME).ELF ] ; then \
	  rm -rf $(TESTNAME).ELF ; \
	fi
	@if [ -e $(TESTNAME).bin ] ; then \
	  rm -rf $(TESTNAME).bin ; \
	fi
	@rm -rf *.crf
	@rm -rf *.plg
	@rm -rf *.tra
	@rm -rf *.htm
	@rm -rf *.map
	@rm -rf *.dep
	@rm -rf *.d
	@rm -rf *.lnp
	@rm -rf *.bak
	@rm -rf *.lst
	@rm -rf *.axf
	@rm -rf *.sct
	@rm -rf *.__i
	@rm -rf *._ia
