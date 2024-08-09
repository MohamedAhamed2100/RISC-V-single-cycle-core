

module RISC_V_TOP_tb ();

      reg CLK = 1 ;
      reg Reset = 1 ; 
      
   always 
     begin 
       #50; CLK=~CLK;
        
      end
 
     initial 
     begin 
        Reset <= 1'b1;
        #50;
        Reset <= 1'b0;
        #1950;
        $finish;   
     end

     initial begin
          $dumpfile("dump.vcd");
          $dumpvars(0);
     end
     
    RISC_V_TOP DUT( 
          .CLK (CLK), 
          .Reset(Reset)
          );

endmodule
