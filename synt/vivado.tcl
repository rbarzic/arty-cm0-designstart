source vivado_utils.tcl

set top_ds [string trim $env(CORTEXM0_DS)]
set xilinx_part [string trim $env(XILINX_PART)]
set top ..

# Cortex-M0 files

set verilog_files []

lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0ds/verilog/CORTEXM0DS.v"
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0ds/verilog/cortexm0ds_logic.v"


# CM-0 Integration
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/models/cells/cm0_dbg_reset_sync.v"
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/cortexm0_wic.v"
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/cortexm0_rst_ctl.v"
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0_dap/verilog/CORTEXM0DAP.v"
lappend verilog_files "$top_ds/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/CORTEXM0INTEGRATION.v"

lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_addr_decode.v"
lappend verilog_files "$top_ds/logical/cmsdk_ahb_slave_mux/verilog/cmsdk_ahb_slave_mux.v"
lappend verilog_files "$top_ds/logical/cmsdk_ahb_default_slave/verilog/cmsdk_ahb_default_slave.v"
lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_ahb_cs_rom_table.v"

lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_sysctrl.v"
lappend verilog_files "$top_ds/logical/cmsdk_ahb_gpio/verilog/cmsdk_ahb_to_iop.v"
lappend verilog_files "$top_ds/logical/cmsdk_iop_gpio/verilog/cmsdk_iop_gpio.v"
lappend verilog_files "$top_ds/logical/cmsdk_ahb_gpio/verilog/cmsdk_ahb_gpio.v"
lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_stclkctrl.v"

# peripherals

lappend verilog_files "$top_ds/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_defs.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_frc.v"

lappend verilog_files "$top_ds/logical/cmsdk_apb_uart/verilog/cmsdk_apb_uart.v"

lappend verilog_files "$top_ds/logical/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v"

lappend verilog_files "$top_ds/logical/cmsdk_apb_subsystem/verilog/cmsdk_irq_sync.v"
#
lappend verilog_files "$top_ds/logical/cmsdk_apb_subsystem/verilog/cmsdk_apb_test_slave.v"

lappend verilog_files "$top_ds/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_defs.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_frc.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers.v"

lappend verilog_files "$top_ds/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_interface.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_reg.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_slave_mux/verilog/cmsdk_apb_slave_mux.v"
lappend verilog_files "$top_ds/logical/cmsdk_ahb_to_apb/verilog/cmsdk_ahb_to_apb.v"

#lappend verilog_files "$top_ds/logical/cmsdk_apb_uart/verilog/cmsdk_apb_uart.v"
lappend verilog_files "$top_ds/logical/cmsdk_apb_subsystem/verilog/cmsdk_apb_subsystem.v"


lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_system.v"

lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_pin_mux.v"

lappend verilog_files "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_clkctrl.v"




# Arty specific file
#lappend verilog_files "$top/rtl/sync_ram_wf_x32.v"
lappend verilog_files "$top/rtl/bytewrite_ram_1b.v"
lappend verilog_files "$top/rtl/cmsdk_ahb_ram.v"
lappend verilog_files "$top/import/amba_components/ahb_to_ssram/rtl/verilog/ahb_to_ssram.v"

lappend verilog_files "$top/ips/clock_manager/arty_mmcm/arty_mmcm_clk_wiz.v"
lappend verilog_files "$top/ips/clock_manager/arty_mmcm/arty_mmcm.v"



lappend verilog_files "$top/rtl/cmsdk_mcu.v"





foreach vfile $verilog_files {
    read_verilog $vfile
}



set include_dir []
lappend include_dir "$top_ds/logical/models/memories/"
lappend include_dir "$top_ds/systems/cortex_m0_mcu/verilog/"
lappend include_dir "$top/import/amba_components/common/include"


read_xdc ./xilinx_constraints.xdc



# synth_design -include_dirs $include_dir -top cmsdk_mcu -part $xilinx_part
# for debugging timing loops
synth_design -include_dirs $include_dir -top cmsdk_mcu -part $xilinx_part -flatten_hierarchy none

set outputDir ./rpt
file mkdir $outputDir

report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_utilization -file $outputDir/post_synth_util.rpt

check_timing -override_defaults loops -verbose > post_synt_loops.rpt



#read_verilog "$top_ds/logical/cmsdk_ahb_to_apb/verilog/cmsdk_ahb_to_apb.v"
#
#
#read_verilog "$top_ds/logical/models/memories/cmsdk_ahb_memory_models_defs.v"
#
#read_verilog "$top_ds/logical/models/memories/cmsdk_ahb_ram_beh.v"
#read_verilog "$top_ds/logical/models/memories/cmsdk_ahb_rom.v"
#read_verilog "$top_ds/logical/models/clkgate/cmsdk_clock_gate.v"
#read_verilog "$top_ds/logical/cmsdk_ahb_gpio/verilog/cmsdk_ahb_to_iop.v"
#
#
#
#

#read_verilog "$top_ds/systems/cortex_m0_mcu/verilog/tb_cmsdk_mcu.v"
#read_verilog "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_uart_capture.v"

#
#read_verilog "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_clkreset.v"
#read_verilog "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu.v"
#read_verilog "$top_ds/systems/cortex_m0_mcu/verilog/cmsdk_mcu_defs.v"
#
#
#
#



opt_design
reportCriticalPaths $outputDir/post_opt_critpath_report.csv
place_design
report_clock_utilization -file $outputDir/clock_util.rpt
#
# Optionally run optimization if there are timing violations after placement
if {[get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]] < 0} {
puts "Found setup timing violations => running physical optimization"
phys_opt_design
}
write_checkpoint -force $outputDir/post_place.dcp
report_utilization -file $outputDir/post_place_util.rpt
report_timing_summary -file $outputDir/post_place_timing_summary.rpt
#
# STEP#5: run the router, write the post-route design checkpoint, report the routing
# status, report timing, power, and DRC, and finally save the Verilog netlist.
#
route_design
write_checkpoint -force $outputDir/post_route.dcp
report_route_status -file $outputDir/post_route_status.rpt
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
#write_verilog -force $outputDir/cpu_impl_netlist.v -mode timesim -sdf_anno true
#
# STEP#6: generate a bitstream
#
write_bitstream -force $outputDir/cpu.bit

# STEP #7 : netlist with timing
write_verilog -force -mode timesim -sdf_anno true chip_layout.v
write_sdf -force chip_layout.sdf
