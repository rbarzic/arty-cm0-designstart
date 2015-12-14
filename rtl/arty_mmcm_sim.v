//****************************************************************************/
//  Arty CM0 "DesignStart"
//  RTL IMPLEMENTATION, Synchronous Version
//
//  Copyright (C) yyyy  Ronan Barzic - rbarzic@gmail.com
//  Date            :  Tue Nov 17 16:37:55 2015
//
//  This program is free software; you can redistribute it and/or
//  modify it under the terms of the GNU General Public License
//  as published by the Free Software Foundation; either version 2
//  of the License, or (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,MA 02110-1301,USA.
//
//
//  Filename        :  arty_mmcm_sim.v
//
//  Description     :   A behavioural model from the MMCM (Xilinx) clock component
//
//
//
//****************************************************************************/


module arty_mmcm (/*AUTOARG*/
   // Outputs
   clk_50m, locked,
   // Inputs
   clk_in, resetn
   );


   input clk_in;
   output clk_50m;
   input  resetn;
   output locked;

   /*AUTOINPUT*/
   /*AUTOOUTPUT*/

   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg                  clk_50m;
   reg                  locked;
   // End of automatics
   /*AUTOWIRE*/

   always @(posedge clk_in or negedge resetn) begin
      if(resetn == 1'b0) begin
         /*AUTORESET*/
         // Beginning of autoreset for uninitialized flops
         clk_50m <= 1'h0;
         // End of automatics
      end
      else begin
         clk_50m <= !clk_50m;
      end
   end

   always @(posedge clk_50m or negedge resetn) begin
      if(resetn == 1'b0) begin
         /*AUTORESET*/
         // Beginning of autoreset for uninitialized flops
         locked = 1'h0;
         // End of automatics
      end
      else begin
         locked <= 1'b1;

      end
   end



endmodule // arty_mmcm_sim
/*
 Local Variables:
 verilog-library-directories:(
 "."
 )
 End:
 */
