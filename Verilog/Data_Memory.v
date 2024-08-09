
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:52:43 08/07/2024 
// Design Name: 
// Module Name:    Data_Memory 
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
module Data_Memory(
     input clk , reset , MemWrite , MemRead , 
     input  [31:0] A , WD , 
     output [31:0] RD 
	  );
	  
    reg [8:0] DataMemory [1023:0];
    assign RD = (MemRead) ? {DataMemory[A],DataMemory[A+1],DataMemory[A+2],DataMemory[A+3]}: 32'b0;

    integer k;
	 
    always @(posedge clk)
    begin

        if (reset == 1'b1) 
		  begin 
		     for (k = 0; k < 1024; k = k + 1) 
		         DataMemory[k] <= 8'b0; 
		  end
		
        else if (MemWrite) 
		  begin 
		      {DataMemory[A],DataMemory[A+1],DataMemory[A+2],DataMemory[A+3]} <= WD;
        end
   end

endmodule
