context = {
    'top': '/home/ronan/perso/github/arty-designstart-cm0',
    'top_ds': '/home/ronan/perso/github/cortexm0_designstart',
}

def arty_cm0():

    l = list()
    d = list()
    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0ds/verilog/CORTEXM0DS.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0ds/verilog/cortexm0ds_logic.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    # CM-0 Integration
    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/models/cells/cm0_dbg_reset_sync.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/cortexm0_wic.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    # l.append({
    #     'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/cortexm0_rst_ctl.v",  # noqa
    #     'targets': 'synt,sim_rtl'
    # })

    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0_dap/verilog/CORTEXM0DAP.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/cores/cortexm0_designstart_r1p0/logical/cortexm0_integration/verilog/CORTEXM0INTEGRATION.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_addr_decode.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_ahb_slave_mux/verilog/cmsdk_ahb_slave_mux.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_ahb_default_slave/verilog/cmsdk_ahb_default_slave.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_ahb_cs_rom_table.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_sysctrl.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_ahb_gpio/verilog/cmsdk_ahb_to_iop.v",
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_iop_gpio/verilog/cmsdk_iop_gpio.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_ahb_gpio/verilog/cmsdk_ahb_gpio.v",
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_stclkctrl.v",
        'targets': 'synt,sim_rtl'
    })

    # peripherals

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_defs.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog.v",
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_watchdog/verilog/cmsdk_apb_watchdog_frc.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_uart/verilog/cmsdk_apb_uart.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_timer/verilog/cmsdk_apb_timer.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_subsystem/verilog/cmsdk_irq_sync.v",
        'targets': 'synt,sim_rtl'
    })
    #
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_subsystem/verilog/cmsdk_apb_test_slave.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_defs.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers_frc.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_dualtimers/verilog/cmsdk_apb_dualtimers.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_interface.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb4_eg_slave/verilog/cmsdk_apb4_eg_slave_reg.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_slave_mux/verilog/cmsdk_apb_slave_mux.v",  # noqa
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/logical/cmsdk_ahb_to_apb/verilog/cmsdk_ahb_to_apb.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/logical/cmsdk_apb_subsystem/verilog/cmsdk_apb_subsystem.v",  # noqa
        'targets': 'synt,sim_rtl'
    })


    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_system.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_pin_mux.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_mcu_clkctrl.v",
        'targets': 'synt,sim_rtl'
    })


    # Arty specific file

    l.append({
        'file': "{top}/rtl/bytewrite_ram_1b.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top}/rtl/cmsdk_ahb_ram.v",
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top}/import/amba_components/ahb_to_ssram/rtl/verilog/ahb_to_ssram.v",  # noqa
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top}/ips/clock_manager/arty_mmcm/arty_mmcm_clk_wiz.v",
        'targets': 'synt_xilinx,sim_rtl_xilinx'
    })

    l.append({
        'file': "{top}/ips/clock_manager/arty_mmcm/arty_mmcm.v",
        'targets': 'synt_xilinx,sim_rtl_xilinx'
    })

    l.append({
        'file': "{top}/rtl/arty_mmcm_sim.v",
        'targets': 'sim_rtl_iverilog'
    })

    l.append({
        'file': "{top}/rtl/cmsdk_mcu.v",
        'targets': 'synt,sim_rtl'
    })

    # testbench files

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_uart_capture.v",
        'targets': 'synt,sim_rtl'
    })

    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/cmsdk_clkreset.v",
        'targets': 'synt,sim_rtl'
    })
    l.append({
        'file': "{top_ds}/systems/cortex_m0_mcu/verilog/tb_cmsdk_mcu.v",
        'targets': 'synt,sim_rtl'
    })

    # Include directories

    d.append({
        'dir': "{top_ds}/logical/models/memories/",
        'targets': 'synt,sim_rtl'
    })
    d.append({
        'dir': "{top_ds}/logical/cmsdk_apb_watchdog/verilog/",
        'targets': 'synt,sim_rtl'
    })

    d.append({
        'dir': "{top_ds}/logical/cmsdk_apb_dualtimers/verilog/",
        'targets': 'synt,sim_rtl'
    })

    d.append({
        'dir': "{top_ds}/systems/cortex_m0_mcu/verilog/",
        'targets': 'synt,sim_rtl'
    })
    d.append({
        'dir': "{top}/import/amba_components/common/include",
        'targets': 'synt,sim_rtl'
    })

    return l, d
