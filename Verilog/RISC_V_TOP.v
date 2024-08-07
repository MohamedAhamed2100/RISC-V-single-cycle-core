`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:52:26 08/07/2024 
// Design Name: 
// Module Name:    RISC_V_TOP 
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

module RISC_V_TOP( 
     input CLK , Reset
    );
	 
	wire Reg_Write , Mem_Write , Mem_Read , mem_to_Reg , PC_Src , zero , branch , ALU_Src;
 
	wire [ 31 : 0  ] Imm_Ext , instruction , PC_Plus4 , read_data ,read_datal , read_data2 , Muxed_Src_B , ALU_result , Result , PC_target , PC , PC_Next;
	wire [ 2 :  0  ] ALU_Control; 
	
	wire [  1 : 0  ] ALU_Op;
	wire [ 19 : 15 ] read_reg1;
   wire [ 24 : 20 ] read_reg2;
	wire [ 11 : 7  ] write_reg;
	wire [  6 : 0  ] OP_Code ;
	wire [ 31 : 25 ] func_7 ;
	wire [ 14 : 12 ] func_3 ;
	 
	assign read_reg1  = instruction [ 19 : 15 ];
	assign read_reg2  = instruction [ 24 : 20 ];
	assign write_reg  = instruction [ 11 : 7  ];
	assign OP_Code    = instruction [  6 : 0  ];
	assign func_7     = instruction [ 31 : 25 ];
	assign func_3     = instruction [ 14 : 12 ];
	
	assign PC_Src = zero & branch ;
	
	Mux_2x1 M1 (
	   .X1 (PC_Plus4),
		.X2 (PC_target),
		.Y  (PC_Next),
		.S  (PC_Src)
	    );

	Program_counter Prog_Count (
		.CLK     (CLK), 
		.Reset   (Reset), 
		.PC_Next (PC_Next), 
		.PC      (PC)
		 );
	
	PCPlus4_Adder PCp4_Add( 
	  .PC      (PC), 
	  .PCPlus4 (PC_Plus4)
	   );	 
	
   PCTarget  PC_Targ(
	  .PC       (PC), 
	  .ImmExt   (Imm_Ext),
	  .PCtarget (PC_target)
	    );

	Instruction_Memory Instr_Mem (
	   .CLK   (CLK), 
		.Reset (Reset), 
	   .A     (PC), 
	   .RD    (instruction) 
	    );

   Register_File Reg_File(
	  .CLK   (CLK), 
	  .Reset (Reset),
	  .A1    (read_reg1), 
	  .A2    (read_reg2), 
	  .A3    (write_reg), 
     .WD    (Result),
	  .WE    (Reg_Write), 
	  .RD1   (read_datal), 
	  .RD2   (read_data2) 
      );

	ALU alu(
	  .Src_A      (read_datal),
	  .Src_B      (Muxed_Src_B), 
	  .zero       (zero), 
	  .ALUcontrol (ALU_Control), 
	  .ALUResult  (ALU_result) 
	   );

   Immediat_Generator Imm_Gen(
	  .Instruction (instruction),
     .ImmExt      (Imm_Ext)
      );
		
	Mux_2x1 M2 (
	   .X1 (read_data2),
		.X2 (Imm_Ext),
		.Y  (Muxed_Src_B),
		.S  (ALU_Src)
	    );

	Data_Memory Data_Mem (
	  .clk      (CLK), 
	  .reset    (Reset),
	  .MemWrite (Mem_Write),
	  .MemRead  (Mem_Read), 
	  .A        (ALU_result), 
	  .WD       (read_data2), 
	  .RD       (read_data) 
	   );
		
	Mux_2x1 M3 (
	  .X1 (ALU_result),
	  .X2 (read_data),
	  .Y  (Result),
	  .S  (mem_to_Reg)
	   );
 
   ALU_Control ALU_Cont(
     .ALUOp       (ALU_Op), 
	  .func7       (func_7), 
	  .func3       (func_3), 
	  .ALUControl  (ALU_Control) 
	   );

   Control_Unit Cont_Uni (
	  .Zero     (zero),
	  .OP_Code  (OP_Code), 
	  .Branch   (branch), 
     .MemRead  (Mem_Read), 
	  .MemtoReg (mem_to_Reg), 
	  .MemWrite (Mem_Write), 
	  .ALUScr   (ALU_Src), 
	  .RegWrite (Reg_Write), 
	  .ALUOp    (ALU_Op) 
	   );
		
endmodule


