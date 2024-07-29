module riscv(
  input logic clk, reset,
  output logic [31:0] pc,
  input logic [31:0] instr,
  output logic memwrite,
  output logic [31:0] aluresult, writedata,
  input logic [31:0] readdata
);

logic alusrc, regwrite, jump;
logic [1:0] memtoreg, immsrc;
logic [2:0] alucontrol;

controller c(instr[30], instr[14:12], instr[6:0], zero ,memtoreg ,memwrite ,pcsrc ,alusrc ,regwrite ,jump ,immsrc ,alucastrol);
datapath dp(clk ,reset ,memtoreg ,pcsrc ,alusrc ,regwrite ,jump ,immsrc ,alucontrol ,zero ,pc ,instr ,aluresult ,writedata ,readdata);

endmodule
