module immext(
    input logic [31:7] instr,
    input logic [1:0] immsrc,
    output logic [31:0] extimm
    );
always_comb
    case(immsrc)
             // I-type (Data processing with immediate and loads)
      2'b00:    extimm = {{21{instr[31]}}, instr[30:20]};
             // S-type (Stores)
      2'b01:    extimm = {{21{instr[31]}}, instr[30:25], instr[11:7]};
             // B-type (Branches)
      2'b10:    extimm = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
             // U-type (Jumps) 
      2'b11:    extimm = {{12{instr[31]}}, instr [19:12], instr[20], instr[30:21], 1'b0};
      default:  extimm = 32'bx; // undefined
   endcase
endmodule
