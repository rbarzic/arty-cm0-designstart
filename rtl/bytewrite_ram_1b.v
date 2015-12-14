// Single-Port BRAM with Byte-wide Write Enable
//	Read-First mode
//	Single-process description
//	Compact description of the write with a generate-for
//   statement
//	Column width and number of columns easily configurable
//
// bytewrite_ram_1b.v
//

module bytewrite_ram_1b (clk, we, addr, din, dout);

parameter SIZE = 1024;
parameter ADDR_WIDTH = 12;
parameter COL_WIDTH = 8;
parameter NB_COL = 4;

parameter filename = "code.hex";


input	clk;
input	[NB_COL-1:0]	we;
input	[ADDR_WIDTH-1:0]	addr;
input	[NB_COL*COL_WIDTH-1:0] din;
output reg [NB_COL*COL_WIDTH-1:0] dout;

reg	[NB_COL*COL_WIDTH-1:0] RAM [SIZE-1:0];

   integer                     _i;

initial begin
`ifndef IVERILOG
   $readmemh(filename,RAM);
`endif
   #10;
   // Just for debugging readmemh in case it does not work as expected
   for(_i=0;_i<6;_i=_i+1) begin
      $display("idx : %d data : %x",_i,RAM[_i]);
   end
   $display("======================");
end


always @(posedge clk)
begin
    dout <= RAM[addr];
end

generate genvar i;
for (i = 0; i < NB_COL; i = i+1)
begin
always @(posedge clk)
begin
    if (we[i])
        RAM[addr][(i+1)*COL_WIDTH-1:i*COL_WIDTH] <= din[(i+1)*COL_WIDTH-1:i*COL_WIDTH];
    end
end
endgenerate

endmodule
