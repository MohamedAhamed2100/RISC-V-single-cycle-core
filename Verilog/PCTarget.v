
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:21:07 08/07/2024 
// Design Name: 
// Module Name:    PCTarget 
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
module PCTarget(
     input  [ 31 : 0 ] PC , ImmExt ,
	  output [ 31 : 0 ] PCtarget
    );
    
    wire [31:0] res ; 
    assign res =  ImmExt - PC ;
    assign PCtarget = PC + res ;
	 
endmodule
