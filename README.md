# arty-designstart-cm0

[![Join the chat at https://gitter.im/rbarzic/arty-cm0-designstart](https://badges.gitter.im/rbarzic/arty-cm0-designstart.svg)](https://gitter.im/rbarzic/arty-cm0-designstart?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


[![arty-cm0-designstart HuBoard](https://img.shields.io/github/issues/rbarzic/arty-cm0-designstart.svg?label=issues%20%28HuBoard%29)](https://huboard.com/rbarzic/arty-cm0-designstart)


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

More documentation is available [here](http://rbarzic.github.io/arty-cm0-designstart/)
