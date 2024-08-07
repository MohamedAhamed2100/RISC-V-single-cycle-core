`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:26:30 08/07/2024 
// Design Name: 
// Module Name:    Mux_2x1 
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
module Mux_2x1(
    input [31:0] X1 , X2 ,
    output [31:0] Y,
    input S
    );
    
	 assign Y = S ? X2 : X1 ;

endmodule
