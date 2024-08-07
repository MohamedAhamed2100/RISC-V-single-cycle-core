`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:58 08/06/2024 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
      input CLK , Reset, 
		input  [ 31 : 0 ] A,  // next machine code address 
		output [ 31 : 0 ] RD  // instruction 
    );
	 
	 reg [31:0] I_Memory [63:0] ;
	 integer K ;
	 
	 always @( posedge CLK )
	 begin 
	 
	      if ( Reset == 1'b1 )
			begin
			   for ( K = 0 ; K < 64 ; K= K + 1  )
				    I_Memory[K] <= 32'b0 ;
			end
	 
	 end
	 
	 assign RD = I_Memory[A] ;
	 
endmodule
