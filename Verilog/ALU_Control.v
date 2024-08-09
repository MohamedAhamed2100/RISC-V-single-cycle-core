
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:34:12 08/07/2024 
// Design Name: 
// Module Name:    ALU_Control 
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

module ALU_Control (
       input [1:0]   ALUOp,
       input [31:25] func7,
       input [14:12] func3,
       output reg [2:0] ALUControl
    );
	 
    always @(*)
	 begin
       if       ({ALUOp, func7, func3} == 12'b00_0000000_XXX) ALUControl <= 3'b010;
       else if  ({ALUOp, func7, func3} == 12'b01_0000000_000) ALUControl <= 3'b010;
       else if  ({ALUOp, func3}        == 12'b10_000)         ALUControl <= 3'b110;
       else if  ({ALUOp, func7, func3} == 12'b01_0100000_000) ALUControl <= 3'b110;
       else if  ({ALUOp, func3}        == 12'b00_010)         ALUControl <= 3'b010;
       else if  ({ALUOp, func7, func3} == 12'b01_0000000_111) ALUControl <= 3'b000;
       else if  ({ALUOp, func7, func3} == 12'b01_0000000_110) ALUControl <= 3'b001;
       else if  ({ALUOp, func7, func3} == 12'b01_0000000_010) ALUControl <= 3'b111;
       else                                                   ALUControl <= 3'b010; 
			 
   end

endmodule

