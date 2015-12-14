// Example from
// http://rattus-pubis.blogspot.no/2011/02/experimenting-with-verilator-counter.html
//


#include "Vcmsdk_mcu.h"
#include "verilated.h"
#include "verilated_vcd_c.h"


int main(int argc, char **argv, char **env) {
  int i;
  int clk;
  Verilated::commandArgs(argc, argv);
  // init top verilog instance
  Vcmsdk_mcu* top = new Vcmsdk_mcu;
  // init trace dump
  Verilated::traceEverOn(true);
  VerilatedVcdC* tfp = new VerilatedVcdC;
  top->trace (tfp, 99);
  tfp->open ("cmsdk_mcu.vcd");
  // initialize simulation inputs
  top->XTAL1 = 1;
  top->NRST  = 0;
  top->nTRST  = 0;
  top->TDI    = 0;
  top->SWCLKTCK    = 0;
  // run simulation for 100 clock periods
  for (i=0; i<200000; i++) {
    top->NRST = (i > 2);
    // dump variables into VCD file and toggle clock
    for (clk=0; clk<2; clk++) {
      tfp->dump (2*i+clk);
      top->XTAL1 = !top->XTAL1;
      top->eval ();
    }
    if (Verilated::gotFinish())  exit(0);
  }
  tfp->close();
  exit(0);
}
