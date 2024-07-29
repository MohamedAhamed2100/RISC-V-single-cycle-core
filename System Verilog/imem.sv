// we have 19 instruction in RISC-V test so we roughly need 6 bits for program counter that called in here input a
module imem (
  input logic [5:0] a,
  output logic [31:0] rd
);

logic [31:0] RAM [63:0];

initial
begin
   $readmemh("ins_mem_file.dat",RAM); 
end 

assign rd = RAM[a];

endmodule 
