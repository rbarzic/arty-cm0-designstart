# Makefile to generate tools configuration files

iverilog:
	@python arty.py --topdir=.. --designstart=$(DESIGNSTART_TOP) --iverilog ../sim/iverilog_file_list.txt

vivado_sim:
	@python arty.py --topdir=.. --designstart=$(DESIGNSTART_TOP) --vivado_sim ../sim/vivado_file_list.txt

vivado_synt:
	@python arty.py --topdir=.. --designstart=$(DESIGNSTART_TOP) --vivado_synt ../sim/vivado_file_list.tcl


all: iverilog vivado_sim
