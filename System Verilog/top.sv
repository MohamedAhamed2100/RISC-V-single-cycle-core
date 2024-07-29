// top module is a top level or high level of abstraction of Risc-V architeture 
// one Risc-V processor and two external memories (one for instruction and the other for data) 
// this module describe device under the test (RISC-V processor)

module top(
   input  logic        clk , reset,
   output logic [31:0] writedata , dataadr,
   output logic        memwrite 
);

logic [31:0] PC , instr , readdata ;

// instanciation of processor and memories 
riscv riscv(clk ,reset ,PC , instr ,memwrite ,dataadr ,writedata ,readdata);
dmem dmem(clk,memwrite ,dataadr ,writedata ,readdata);
imem imem(PC[7:2] , instr);

endmodule