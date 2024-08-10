`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:43 08/05/2024 
// Design Name: 
// Module Name:    Full_Adder 
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
module Full_Adder(
    input X,Y,
	 input C_IN,
	 output S,C_OUT
    );
    
	 Half_Adder HA0(
     .X(X),
     .Y(Y),
     .S(S1),
     .C_OUT(C1)
    );
	 
	 Half_Adder HA1(
     .X(S1),
     .Y(C_IN),
     .S(S),
     .C_OUT(C2)
    );
	 
	 assign C_OUT = C1 | C2 ;
	 
endmodule
