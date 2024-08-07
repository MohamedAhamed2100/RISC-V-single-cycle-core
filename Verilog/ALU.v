`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:06:45 08/07/2024 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] Src_A ,Src_B,
    input [2:0] ALUcontrol,
    output reg zero,
    output reg [31:0] ALUResult  
 );
    always @ (ALUcontrol or Src_A or Src_B)
    begin
       case (ALUcontrol)
		 
          3'b000: 
			 begin 
			    zero<=0; 
			    ALUResult<=Src_A&Src_B; 
			 end
			 
          3'b001: 
			 begin 
			   zero<=0; 
			   ALUResult<=Src_A|Src_B; 
			 end
			 
          3'b010: 
			 begin 
			   zero<=0;
			   ALUResult<=Src_A+Src_B; 
			 end
			 
          3'b110:
			 begin 
			     if (Src_A==Src_B) 
					   zero<=1; 
				  else 
					   zero<=0; 
				  ALUResult<=Src_A-Src_B; 
			 end 
			 
          default: 
			 begin 
			    zero<=0; 
			    ALUResult<=Src_A; 
			 end
			 
       endcase
   end

endmodule
