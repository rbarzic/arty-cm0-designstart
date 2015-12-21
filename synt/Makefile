# Vivado synt script


CORTEXM0_DS ?= ../../../arm/cortexm0_designstart
XILINX_PART=xc7a35tcsg324-1
export CORTEXM0_DS
export XILINX_PART
synt:
	vivado -mode tcl -source vivado.tcl


mmi:
	python yaml2mmi.py > cortexm0.mmi

# use --debug option below if something is wrong after updating the bitstream
update:
	updatemem --debug -bit rpt/cpu.bit -meminfo cortexm0.mmi  -data ../software/$(TEST)/$(TEST).elf  -proc design/cortex -o $(TEST).bit | tee debug.txt
