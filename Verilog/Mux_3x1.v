module Mux_3x1(
    input  [31:0] X1 , X2 , X3 , 
    output reg [31:0] Y,
    input  [1 :0] S
    );
	
  always @(*) 
	begin
		 case (S)
			  2'b00   : Y = X1 ;
			  2'b01   : Y = X2 ;
			  2'b10   : Y = X3 ;
			  default : Y = 32'bx ;
		 endcase	
	end 	

endmodule