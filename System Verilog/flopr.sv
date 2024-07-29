module flopr #(parameter width = 8)(
  input logic clk ,reset,
  input logic [width-1:0] d,
  output logic [width-1:0] q
);
always @(posedge clk , posedge reset)
    if (reset)
      q <= 0;
    else 
      q <= d;

endmodule 
