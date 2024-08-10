`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:47:36 08/06/2024 
// Design Name: 
// Module Name:    Add_Subtractor_nb 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Add_Subtractor_nb 
       #(parameter N = 32)(
	     input  [N-1:0] X,
         input  [N-1:0] Y,
         input   Add_n,
         output [N-1:0] S,
         output  C_OUT ,
		 output overflow , lessthan
    );
	 
	     wire [N-1:0] Xored_Y;
	     genvar K;
		 
	 generate 
	        
			  for(K = 0 ; K < N ; K = K + 1)
			  begin : 
			 	  assign Xored_Y[K] = Y[K]^Add_n;
			  end 
		  
	 endgenerate 
	 
	 N_RCA #(.N(N))RC (
      .X(X),
      .Y(Xored_Y),
      .C_IN(Add_n),
      .S(S),
      .C_OUT(C_OUT)
    );
	 
	 assign overflow = X[N-1] & Y[N-1] & ~S[N-1] | ~X[N-1] & ~Y[N-1] & S[N-1];
	 assign lessthan = overflow ^ Y[N-1];
	 
endmodule
