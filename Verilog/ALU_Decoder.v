
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

// implementation of Alu Decoder 

module ALU_Decoder (
       input [1:0] ALUOp   ,
	   input OPCode_b5     , func7_b5,  //5b : fifth bit 
       input [2:0] func3   ,
       output reg [2:0] ALUControl
    );
	 
    always @(*)
	 begin
       casex({ALUOp, func3, OPCode_b5, func7_b5}) 
		   12'b00_xxx_x_x: ALUControl <= 3'b000;   // lw,sw   (add)
		   12'b01_xxx_x_x: ALUControl <= 3'b001;   // beq     (sub) 
	       12'b10_000_0_0: ALUControl <= 3'b000;   // add,addi(add)
		   12'b10_000_0_1: ALUControl <= 3'b000;   // add,addi(add)
		   12'b10_000_1_0: ALUControl <= 3'b000;   // add,addi(add)
		   12'b10_000_1_1: ALUControl <= 3'b001;   // sub,subi(sub)
		   12'b10_010_x_x: ALUControl <= 3'b101;   // slt
	       12'b10_110_x_x: ALUControl <= 3'b010;   // or
		   12'b10_111_x_x: ALUControl <= 3'b011;   // and
		   default       : ALUControl <= 3'b000;   
       endcase                                                
			 
   end

endmodule

