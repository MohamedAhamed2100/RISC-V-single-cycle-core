
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohamed Ahmed 
// 
// Create Date:    22:55:48 08/06/2024 
// Design Name: 
// Module Name:    PCPlus4_Adder 
// Project Name: 
// Target Devices: 
// Tool versions: ISE_Design_Suite
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PCPlus4_Adder(
      input  [ 31 : 0 ] PC ,
		output [ 31 : 0 ] PCPlus4 
    );
    
	 assign PCPlus4 = PC + 32'h00000004 ;   

endmodule
