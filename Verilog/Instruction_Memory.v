
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:58 08/06/2024 
// Design Name: 
// Module Name:    Instruction_Memory 
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
module Instruction_Memory(
    input CLK , Reset, 
		input  [ 31 : 0 ] A,  // next machine code address 
		output [ 31 : 0 ] RD  // instruction 
    );
	 
	 reg [8:0] I_Memory [1023:0] ;
	 integer K ;
	 
	 always @( posedge CLK )
	 begin 
	 
	      if ( Reset == 1'b1 )
			begin
			   for ( K = 0 ; K < 1024 ; K= K + 1  )
				    I_Memory[K] <= 8'b0 ;
			end
	 
	 end
	 
	 initial 
	 begin
	        #50;
          //$readmemh("memory_file.dat",I_Memory);
          {I_Memory[0],I_Memory[1],I_Memory[2],I_Memory[3]}     = 32'h00500113 ;
          {I_Memory[4],I_Memory[5],I_Memory[6],I_Memory[7]}     = 32'h00c00193 ;
          {I_Memory[8],I_Memory[9],I_Memory[10],I_Memory[11]}   = 32'hff718393 ;
          {I_Memory[12],I_Memory[13],I_Memory[14],I_Memory[15]} = 32'h0023e233 ;
          {I_Memory[16],I_Memory[17],I_Memory[18],I_Memory[19]} = 32'h0041f2b3 ;
          {I_Memory[20],I_Memory[21],I_Memory[22],I_Memory[23]} = 32'h004282b3 ;
          {I_Memory[24],I_Memory[25],I_Memory[26],I_Memory[27]} = 32'h08538463 ;
          {I_Memory[28],I_Memory[29],I_Memory[30],I_Memory[31]} = 32'h0041a233 ;
          {I_Memory[32],I_Memory[33],I_Memory[34],I_Memory[35]} = 32'h04400863 ;
          {I_Memory[36],I_Memory[37],I_Memory[38],I_Memory[39]} = 32'h00000293 ;
          {I_Memory[40],I_Memory[41],I_Memory[42],I_Memory[43]} = 32'h0023a233 ;
          {I_Memory[44],I_Memory[45],I_Memory[46],I_Memory[47]} = 32'h005203b3 ;
          {I_Memory[48],I_Memory[49],I_Memory[50],I_Memory[51]} = 32'h402383b3 ;
          {I_Memory[52],I_Memory[53],I_Memory[54],I_Memory[55]} = 32'h0071ae23 ;
          {I_Memory[56],I_Memory[57],I_Memory[58],I_Memory[59]} = 32'h02802103 ;
          {I_Memory[60],I_Memory[61],I_Memory[62],I_Memory[63]} = 32'h088001ef ;
          {I_Memory[64],I_Memory[65],I_Memory[66],I_Memory[67]} = 32'h00100113 ;
          {I_Memory[68],I_Memory[69],I_Memory[70],I_Memory[71]} = 32'h00310133 ;
          {I_Memory[72],I_Memory[73],I_Memory[74],I_Memory[75]} = 32'h02202623 ;
   end
	 
	 assign RD = {I_Memory[A],I_Memory[A+1],I_Memory[A+2],I_Memory[A+3]} ;
	 
	 
endmodule
