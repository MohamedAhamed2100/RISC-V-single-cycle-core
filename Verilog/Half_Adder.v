`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:45:39 08/05/2024 
// Design Name: 
// Module Name:    Half_Adder 
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
module Half_Adder(
    input X,
    input Y,
    output S,
    output C_OUT
    );
    
	 assign S = X ^ Y ;
	 assign C_OUT = X & Y ;

endmodule
