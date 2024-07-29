module mux3 #(parameter width = 8) 
(
   input logic [width-1:0] d0,d1,d2,
   input logic [1:0] s,
   output logic [width-1:0] y 
);

always_comb
begin
  case (s)
     2'b00: y = d0;
     2'b01: y = d1;
     2'b10: y = d2;
     default: y = 'b0;
  endcase
end

endmodule