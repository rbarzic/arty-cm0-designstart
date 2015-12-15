`define hclk tb_cmsdk_mcu.u_cmsdk_mcu.u_cmsdk_mcu_system.u_cortexm0integration.u_cortexm0.HCLK
`define pc   tb_cmsdk_mcu.u_cmsdk_mcu.u_cmsdk_mcu_system.u_cortexm0integration.u_cortexm0.cm0_pc[31:0]
`define r0   tb_cmsdk_mcu.u_cmsdk_mcu.u_cmsdk_mcu_system.u_cortexm0integration.u_cortexm0.cm0_r00[31:0]


wire [31:0] pc;
assign pc = `pc;
