module regfile
(  input logic clk,
   input logic we3,
   input logic [4:0] ral, ra2, wa3,
   input logic [31:0] wd3,
   output logic [31:0] rdl, rd2
);

logic [31:0] rf [31:0];

always_ff @(posedge clk) 
     if (we3) 
        rf[wa3] <= wd3;

assign rdi = (ral != 0) ? rf[ral]: 0;
assign rd2 = (ra2 != 0) ? rf[ra2]: 0;

endmodule
