module Test_bench ();
  logic clk , reset ;
  logic [31:0] dataadr , writedata;
  logic memwrite;
  
  // instanciation of device under test
  top dut (clk , reset , writedata , dataadr , memwrite);
  
  //Initiate test
  initial
  begin
    reset <= 1; #22; 
    reset <= 0;   
  end

  //generate Clock
  always
  begin
    clk <= 1; #5;
    clk <= 0; #5;
  end 

  // check result
  always @(negedge clk)
  begin
    if(memwrite)
    begin 
      if( dataadr===84 & writedata===71)  
      begin
        $display("Simulation Succeded");
        $stop;
      end  
      else if(dataadr!==80)  
      begin
        $display("Simulation Falid");
        $stop;
      end
    end 
  end        
endmodule 