
module RISC_V_TOP_tb ();

   reg CLK , Reset ;
   
   RISC_V_TOP DUT( 
          .CLK (CLK), 
          .Reset(Reset)
          );
  
   always #50 CLK=~CLK; 
 
   initial 
     begin 
        $dumpfile("DUT.vcd");
        $dumpvars;
        CLK   <= 1 ;
        Reset <= 1 ; 
        #50   Reset <= 1'b0;
        #1950 $finish;   
     end
    
endmodule
