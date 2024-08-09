
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
	 
	wire Reg_Write , Mem_Write , PC_Src , zero , branch , ALU_Src ,Jump ,OPCode_b_5 ,func_7_b_5;
 
	wire [ 31 : 0  ] Imm_Ext , instruction , PC_Plus4 , read_data ,read_datal , read_data2 , Muxed_Src_B , ALU_result , Result , PC_target , PC , PC_Next;
	wire [ 2  : 0  ] ALU_Control; 
	
	wire [  1 : 0  ] ALU_Op  , Imm_Scr , Result_Src;
	wire [ 19 : 15 ] read_reg1;
   wire [ 24 : 20 ] read_reg2;
	wire [ 11 : 7  ] write_reg;
	wire [  6 : 0  ] OP_Code ;
	wire [ 31 : 25 ] func_7 ;
	wire [ 14 : 12 ] func_3 ;
	wire [ 31 : 7  ] Instr_Imm;
	
	assign Instr_Imm  = instruction [ 31 : 7 ] ;
	assign read_reg1  = instruction [ 19 : 15 ];
	assign read_reg2  = instruction [ 24 : 20 ];
	assign write_reg  = instruction [ 11 : 7  ];
	assign OP_Code    = instruction [  6 : 0  ];
	assign OPCode_b_5 = OP_Code [ 5 ];
	assign func_7     = instruction [ 31 : 25 ];
	assign func_7_b_5 = func_7  [ 30 ];
	assign func_3     = instruction [ 14 : 12 ];
	
	
	assign PC_Src = (zero & branch) | Jump ;
	
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
	      .Instr  (Instr_Imm),
		    .ImmScr (Imm_Scr),
        .ImmExt (Imm_Ext)
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
	  .A        (ALU_result), 
	  .WD       (read_data2), 
	  .RD       (read_data) 
	   );
		
	Mux_3x1 M3 (
	  .X1 (ALU_result),
	  .X2 (read_data),
	  .X3 (PC_Plus4),
	  .Y  (Result),
	  .S  (Result_Src)
	   );
 
   ALU_Decoder ALU_Cont(
    .ALUOp       (ALU_Op), 
	  .OPCode_b5   (OPCode_b_5), 
	  .func7_b5    (func_7_b_5),
	  .ALUControl  (ALU_Control), 
	  .func3       (func_3)
	   );

   Main_decoder Cont_Uni (
	  .Zero     (zero),
	  .OP_Code  (OP_Code), 
	  .Branch   (branch), 
	  .Jump     (Jump),
	  .ResultSrc(Result_Src), 
	  .MemWrite (Mem_Write), 
	  .ALUScr   (ALU_Src), 
	  .RegWrite (Reg_Write), 
	  .ALUOp    (ALU_Op) ,
	  .ImmScr   (Imm_Scr)
	   );
		
endmodule


