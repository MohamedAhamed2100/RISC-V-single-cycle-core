
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:51 08/06/2024 
// Design Name: 
// Module Name:    Program_counter 
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
module Program_counter(

     input CLK , Reset ,
	  input [ 31 : 0 ] PC_Next ,
	  output reg [ 31 : 0 ] PC 
	  
    );
	 
	 always @( posedge CLK )
	 begin 
	     
		  if ( Reset == 1'b1 )
			 PC <= 32'h0 ;
		  else
		    PC <= PC_Next ;
			 
	 end 


endmodule
