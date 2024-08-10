`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:35 08/05/2024 
// Design Name: 
// Module Name:    N_RCA 
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
module N_RCA #(parameter N = 32)(
    input  [N-1 : 0] X,
    input  [N-1 : 0] Y,
    input         C_IN,
    output [N-1 : 0] S,
    output       C_OUT
    );
    
	
	 wire [N : 0] C;
	 assign C[0] = C_IN;
	 assign C_OUT = C[N];
	 genvar K  ; 
	 
	 generate 	  
	     for(K=0; K<N; K=K+1)
        begin : stage
           Full_Adder FA (
		        .X( X[K] ),
			    .Y( Y[K] ),
			    .C_IN( C[K] ),
		        .S( S[K] ),
			    .C_OUT( C[K+1] )
		      );
		  end		
	 endgenerate

endmodule
