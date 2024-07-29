module controller(
   input logic f7b5,
   input logic [2:0] funct3,
   input logic [6:0] op,
   input logic zero,
   output logic [1:0] memtoreg,
   output logic memwrite,
   output logic pcsrc, alusrc,
   output logic regwrite, jump,
   output logic [1:0] immsrc,
   output logic [2:0] alucontrol
);
   
   logic [1:0] aluop;
   logic branch;

   maindec md(op ,memtoreg ,memwrite ,branch ,alusrc, regdst, regwrite, jump ,aluop);  
   aludec ad(f7b5 ,funct3 ,aluop ,alucontrol);
   assign pcsrc = branch & zero | jump;
   
endmodule
