//****************************************************************************/
//  AMBA conponents
//  RTL IMPLEMENTATION, Synchronous Version
//
//  Copyright (C) yyyy  Ronan Barzic - rbarzic@gmail.com
//  Date            :  Mon Nov  9 10:03:03 2015
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
//  Filename        :  sync_ram_wf_x32.v
//
//  Description     :   32-bit, byte accessible synchronous RAM model,
//                      write first
//                     suitable for FPGA synthesis (Xilinx Block RAM)
//                     Source : ug901-vivado-synthesis-examples.zip
//
//****************************************************************************/



module sync_ram_wf_x32 (/*AUTOARG*/
   // Outputs
   dout,
   // Inputs
   clk, web, enb, addr, din
   );
   parameter ADDR_WIDTH = 10;

   input clk;
   input [3:0]web;
   input [3:0]enb;
   input [9:0] addr;
   input [31:0] din;
   output [31:0] dout;
   reg [31:0]    RAM [(2<<ADDR_WIDTH)-1:0];
   reg [31:0]    dout;

   always @(posedge clk)
     begin
        if (enb[0])
          begin
             if (web[0])
               begin
                  RAM[addr][7:0] <= din[7:0];
                  dout[7:0] <= din[7:0];
               end
             else begin
                dout[7:0] <= RAM[addr][7:0];
             end
          end
     end // always @ (posedge clk)
   always @(posedge clk)
     begin
        if (enb[1])
          begin
             if (web[1])
               begin
                  RAM[addr][15:8] <= din[15:8];
                  dout[15:8] <= din[15:8];
               end
             else begin
                dout[15:8] <= RAM[addr][15:8];
             end
          end
     end // always @ (posedge clk)

   always @(posedge clk)
     begin
        if (enb[2])
          begin
             if (web[2])
               begin
                  RAM[addr][23:16] <= din[23:16];
                  dout[23:16] <= din[23:16];
               end
             else begin
                dout[23:16] <= RAM[addr][23:16];
             end
          end
     end

   always @(posedge clk)
     begin
        if (enb[3])
          begin
             if (web[3])
               begin
                  RAM[addr][31:24] <= din[31:24];
                  dout[31:24] <= din[31:24];
               end
             else begin
                dout[31:24] <= RAM[addr][31:24];
             end
          end
     end



endmodule // sync_ram_wf
/*
 Local Variables:
 verilog-library-directories:(
 "."
 )
 End:
 */
