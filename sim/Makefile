TEST?=hello

comp:
	iverilog -DIVERILOG -DVCD_DUMP -o tb  -c iverilog_file_list.txt

comp_novcd:
	iverilog -DIVERILOG  -o tb  -c iverilog_file_list.txt


run:
	vvp tb +program_memory=$(TEST).vmem

wave:
	gtkwave tb_cmsdk_mcu.vcd &


help:
	@echo "Targets:"
	@echo "         comp : Compile the design with icarus Verilog (using files listed in iverilog_file_list.txt)"
	@echo "         run : Run the simulation, generating a vcd file"
	@echo "         wave  : View the vcd file using gtkwave vcd viewer"




# For flymake on-the-fly code checking
check-syntax:
	iverilog   -t null -o tb  -c iverilog_file_list.txt



# Xilinx :
# xvlog -f xilinx_vlist.txt
# xelab cmsdk_mcu -relax (because of timescale)
# see ug900
#Step2: Elaborating and Creating a Snapshot
#After analysis, elaborate the design and create a snapshot for simulation using the xelab
#command:
#xelab <topDesignUnitName> -debug typicalx
#IMPORTANT: You can provide multiple top-level design unit names with xelab. To use the Vivado
#simulator workspace for purposes similar to those used during launch_simulation, you must set
#debug level to typical.
#Step 3: Running Simulation
#After successful completion of the xelab phase, the Vivado simulator creates a snapshot
#used for running simulation.
#To invoke the Vivado simulator workspace, use the following command:
#xsim
#<SnapShotName> -gui
#To open the wave config file:
#xsim <SnapShotName> -view <wcfg FileName> -gui
#You can provide multiple wcfg files using multiple -view flags. For example:
#xsim
#<SnapShotName> -view <wcfg FileName> -view <wcfg FileName>

xcomp:
	xvlog --define NO_TIME_SCALE -f vivado_file_list.txt  $(XILINX_VIVADO)/data/verilog/src/glbl.v

xelab:
	xelab -L unisims_ver tb_cmsdk_mcu glbl --relax --debug all

xsim:
	xsim work.tb_cmsdk_mcu#work.glbl  -runall


# hexdump -v -e '"@%08.8_ax  " 1/1 "%02x " "\n"' ../../cortexm0_designstart/systems/cortex_m0_mcu/testcodes/hello/hello.bin > hello.vmem

# "OK" format for Xilinx simulation tool
vmem32:
	hexdump -v -e ' 1/4 "%08x " "\n"' ../../cortexm0_designstart/systems/cortex_m0_mcu/testcodes/hello/hello.bin > hello.vmem32



# SDF
# xvlog --define NO_TIME_SCALE --define SDF_SIM  -f vivado_sdf_file_list.txt  /opt/Xilinx/Vivado/2015.3/data/verilog/src/glbl.v
# xelab -L unisims_ver tb_cmsdk_mcu glbl --relax --debug all --sdftyp cmsdk_mcu=../synt/chip_layout.sdf
#
