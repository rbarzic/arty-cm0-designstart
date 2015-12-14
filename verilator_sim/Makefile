# VERILOG_DEBUG= --debug --gdbbt


build:
	verilator $(VERILOG_DEBUG) -Wno-fatal -Wall --trace --cc -f verilator_file_list.txt --top-module cmsdk_mcu  --exe tb_cmsdk_mcu.cpp

comp:
	make -C obj_dir -j -f Vcmsdk_mcu.mk Vcmsdk_mcu

run:
	obj_dir/Vcmsdk_mcu
