# arty-designstart-cm0

This github repository provides the necessary files to use the
DesignStart Cortex-M0 system on a digilentinc ARTY FPGA board.

**This project does not include the source code of the DesignStart
  Cortex-M0. You have to request it directly from ARM.**

In addition to allow synthesis of the designstart to a Xilinx target,
this project allows also simulations using the simulation tools :
- Icarus iverilog
- Xilinx simulation tools (xvlog/xelab/xsim)
- Verilator



This project uses submodules. To clone it you need to run the following commands :

```bash
 git clone git@github.com:rbarzic/arty-cm0-designstart.git
 cd arty-cm0-designstart
 git submodule init
 git submodule update
```

This is work in progress so expect some rough edges
