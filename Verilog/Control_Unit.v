
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:34:09 08/07/2024 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
      input     [ 6 : 0 ] OP_Code ,
	  input                Zero    ,
	  output reg           Branch , MemRead , MemWrite , ALUScr , RegWrite , Jump ,  
	  output reg [ 1 : 0 ] ALUOp , MemtoReg
    );

  always@(*)
  begin 
     
	  case (OP_Code)
	     7'b0110011 : // R-type instruction
		   begin ALUScr <= 0 ; MemtoReg <= 00 ; RegWrite <= 1 ; MemRead <= 0 ; MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b01 ; Jump  <= 0 ;  end   
		 7'b0010011 : // I-type instruction
		   begin ALUScr <= 1 ; MemtoReg <= 00 ; RegWrite <= 1 ; MemRead <= 0 ; MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b00 ; Jump  <= 0 ;  end     
		 7'b0000011 : // load instruction  
		   begin ALUScr <= 1 ; MemtoReg <= 01 ; RegWrite <= 1 ; MemRead <= 1 ; MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b00 ; Jump  <= 0 ;  end  
		 7'b0100011 : // store instruction
		   begin ALUScr <= 1 ; MemtoReg <= 00 ; RegWrite <= 0 ; MemRead <= 0 ; MemWrite <= 1 ; Branch <= 0 ; ALUOp <= 2'b00 ; Jump  <= 0 ;  end   
		 7'b1100011 : // Branch equal instruction 
		   begin ALUScr <= 0 ; MemtoReg <= 00 ; RegWrite <= 0 ; MemRead <= 0 ; MemWrite <= 0 ; Branch <= 1 ; ALUOp <= 2'b10 ; Jump  <= 0 ; end  
		 7'b1101111 : // J-type 
		   begin ALUScr <= 1'bx ; MemtoReg <= 10 ; RegWrite <= 1 ; MemRead <= 1'bx ; MemWrite <= 1'bx ; Branch <= 1'bx ; ALUOp <= 2'bxx ; Jump  <= 1 ;  end  
		 default :
           begin ALUScr <= 0 ; MemtoReg <= 00 ; RegWrite <= 1 ; MemRead <= 0 ; MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b01 ; Jump  <= 0 ; end   
     endcase
	  
	  
  end

endmodule
