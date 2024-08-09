
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

// implementation of Main Decoder 

module Main_Decoder(
      input      [ 6 : 0 ] OP_Code ,
	  input                Zero    ,
	  output reg           Branch  , MemWrite  , ALUScr , RegWrite , Jump ,  
	  output reg [ 1 : 0 ] ALUOp   , ResultSrc , ImmScr
    );

  always@(*)
  begin 
     
	  case (OP_Code)
	     7'b0110011 : // R-type instruction
		   begin ALUScr <= 0    ; ResultSrc <= 00    ; RegWrite <= 1 ;  MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b10 ; Jump  <= 0 ; ImmScr  <= 2'bxx ; end   
		 7'b0010011 : // I-type instruction  
		   begin ALUScr <= 1    ; ResultSrc <= 00    ; RegWrite <= 1 ;  MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b10 ; Jump  <= 0 ; ImmScr  <= 00    ; end     
		 7'b0000011 : // load instruction  
		   begin ALUScr <= 1    ; ResultSrc <= 01    ; RegWrite <= 1 ;  MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b00 ; Jump  <= 0 ; ImmScr  <= 00    ; end  
		 7'b0100011 : // store instruction
		   begin ALUScr <= 1    ; ResultSrc <= 2'bxx ; RegWrite <= 0 ;  MemWrite <= 1 ; Branch <= 0 ; ALUOp <= 2'b00 ; Jump  <= 0 ; ImmScr  <= 01     ; end   
		 7'b1100011 : // Beq instruction 
		   begin ALUScr <= 0    ; ResultSrc <= 2'bxx ; RegWrite <= 0 ;  MemWrite <= 0 ; Branch <= 1 ; ALUOp <= 2'b01 ; Jump  <= 0 ; ImmScr  <= 10     ; end  
		 7'b1101111 : // Jal instruction 
		   begin ALUScr <= 1'bx ; ResultSrc <= 10    ; RegWrite <= 1 ;  MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'bxx ; Jump  <= 1 ; ImmScr  <= 11     ;end  
		 default :
           begin ALUScr <= 0    ; ResultSrc <= 00    ; RegWrite <= 1 ;  MemWrite <= 0 ; Branch <= 0 ; ALUOp <= 2'b10 ; Jump  <= 0 ; ImmScr  <= 2'bxx ; end  
     endcase
	  
	  
  end

endmodule
