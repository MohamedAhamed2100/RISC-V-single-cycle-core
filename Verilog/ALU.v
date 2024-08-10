
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
    input      [31:0]  Src_A ,Src_B,
    input      [2 :0]  ALUcontrol,
    output reg         zero,
    output reg [31:0]  ALUResult  
 );
 
    wire overflow,lessthan , C_out ; 
	
    always @ (ALUcontrol or Src_A or Src_B)
    begin
       case (ALUcontrol)
		 
		3'b000:  //add
			 begin 
			   zero<=0;
			   Add_Subtractor_nb  add_sub1(
			      .X(Src_A),
				  .Y(Src_B),
				  .Add_n(0),
			      .S(ALUcontrol),
				  .C_OUT(C_out)
				  .overflow(overflow), 
				  .lessthan(lessthan)
			   ); 
			 end 
			 
		3'b001: //sub
			 begin 
			    if (Src_A==Src_B) 
					zero<=1; 
				else 
				  begin 
					zero<=0; 
				    ALUResult<=Src_A-Src_B; 
				  end	
			 end 	 
			 
		3'b010: //or
			 begin 
			   zero<=0; 
			   ALUResult<=Src_A|Src_B; 
			 end
			 
		3'b011: //and
			 begin 
			    zero<=0; 
			    ALUResult<=Src_A&Src_B; 
			 end
			  
		3'b101: //SLT
			 begin 
			    zero<=0;
				Add_Subtractor_nb  add_sub2(
			      .X(Src_A),
				  .Y(Src_B),
				  .Add_n(1),
			      .S(ALUcontrol),
				  .C_OUT(C_out)
				  .overflow(overflow), 
				  .lessthan(lessthan)
			   ); 
				ALUResult<=lessthan; 
			 end 
			  
		default: 
			 begin 
			    zero<=0; 
			    ALUResult<=Src_A; 
			 end
			 
       endcase
   end

endmodule
