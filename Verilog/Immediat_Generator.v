
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:10 08/07/2024 
// Design Name: 
// Module Name:    Immediat_Generator 
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
module Immediat_Generator(
    input      [31:7] Instr ,
	input      [1 :0] ImmScr ,
    output reg [31:0] ImmExt
    );
    
	 always @ (*)
	 begin 
	    case (ImmScr)
		     2'b00 : ImmExt <= { { 20{ Instr[ 31 ] } } , Instr[ 31 : 20 ] }; // I - Type
		     2'b01 : ImmExt <= { { 20{ Instr[ 31 ] } } , Instr[ 31 : 25] , Instr[ 11 : 7 ] }; // S - Type
		     2'b10 : ImmExt <= { { 19{ Instr[ 31 ] } } , Instr[ 31 ] , Instr[ 7 ] , Instr[ 30 : 25 ] , Instr[ 11 : 8 ]   , 1'b0 }; // B - Type
		     2'b11 : ImmExt <= { { 19{ Instr[ 31 ] } } , Instr[ 31 ] , Instr[ 19 : 12 ] , Instr[ 20 ] , Instr[ 30 : 21 ] , 1'b0 }; // J - Type
		     default    : ImmExt <= { { 20{ Instr[ 31 ] } } , Instr[ 31 : 20 ] };
		 endcase
		 
	 end 
endmodule
