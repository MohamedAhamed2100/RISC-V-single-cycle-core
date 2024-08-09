
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:10 08/06/2024 
// Design Name: 
// Module Name:    Register_File 
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
module Register_File(
     input  CLK , Reset , WE , // WE : write enable
	  input  [ 4  : 0 ] A1  , A2  , A3 ,  //  A1 : source register 1 , A2 : source register 2 , A3 : direction register 
	  input  [ 31 : 0 ] WD  ,  
	  output [ 31 : 0 ] RD1 , RD2
    );
   
	 reg [ 31 : 0 ] registers [ 31 : 0 ] ; 
	 integer K ;
	 
	 always @( posedge CLK  )
	 begin 
	 
	      if ( Reset == 1'b1 )
			begin
			   for ( K = 0 ; K < 32 ; K = K + 1  )
				begin
				    registers[K] <= 32'b0 ;
			   end
			end
			
			else if ( WE == 1'b1 )  
			       registers[A3] <= WD ;
				
	 end

     assign RD1 = registers[ A1 ] ;
	 assign RD2 = registers[ A2 ] ;
	 
endmodule
