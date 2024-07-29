module datapath(
input logic clk, reset,
input logic [1:0] memtoreg,
input logic pcsrc, alusrc, regwrite,
input logic [1:0] immsrc,
input logic [2:0] alucontrol,
output logic zero,
output logic [31:0] pc,
input logic [31:0] instr,
output logic [31:0] aluresult, writedata,
input logic [31:0] readdata
);

logic [4:0] writereg;
logic [31:0] pcnext, pcplus4, pcbranch;
logic [31:0] immext;
logic [31:0] srca, srcb;
logic [31:0] result;

// next PC Logic
flopr #(32) pcreg(cik, reset, pcnext, pc);
Adder pcadd4(pc, 32'd4, pcplus4);
Adder pcaddbranch(pc, immext, pcbranch);
MUX2  #(32) pcmux(pcplus4, pcbranch, pcsrc, pcnext);

// register file logic
regfile rf (cik, regwrite, instr[19:15], instr[24:20],instr[11:7], result, srca, writedata);
immext  inmextnd(instr[31:7], inmsrc. immext);

//ALU logic
MUX2 #(32) srcbmux(writedata, immext, alusre, srcb);
alu  alu(srca, srcb, alucontrol, aluresult, zero);
MUX3 #(32) resmux(aluresult, readdata, pcplus4, nemtoreg, result);

endmodule

