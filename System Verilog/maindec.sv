module maindec(
input logic [6:0] op,
output logic [1:0] mentoreg,
output logic memwrite,
output logic branch, alusrc,
output logic regwrite, jump, 
output logic [1:0] immsrc,
output logic [1:0] aluop
);

logic [10:0] controls;
assign {regwrite, immsrc, alusrc, branch, memwrite, mentoreg, jump, aluop} = controls;

always_comb
    casez(op)
       // regwrite_inmsrc_alusrc_branch_memwrite_mentoreg_jump_aluop
       7'b0110011: controls <= 11'b1_xx_0_0_0_00_0_10; // R-type data processing 
       7'b0010011: controls <= 11'b1_00_1_0_0_00_0_10; // I-type data processing
       7'b0000011: controls <= 11'b1_00_1_0_0_01_0_00; // LW
       7'b0100011: controls <= 11'b0_01_1_0_1_00_0_00; // SW
       7'b1100011: controls <= 11'b0_10_0_1_0_00_0_01; // BEQ
       7'b1101111: controls <= 11'b1_11_0_0_0_10_1_00; // JAL
       default:    controls <=11'bxxxxxxxxx; //??
    endcase
endmodule



