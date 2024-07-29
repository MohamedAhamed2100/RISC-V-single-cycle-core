// as compared to MIPS, reduce width of funct and update encoding
module aludec(
    input logic f7b5, op5,
    input logic [2:0] funct3, 
    input logic [1:0] aluop,
    output logic [2:0] alucontrol
    );
  logic addSubType;
  assign addSubType = f7b5 & op5;
  
  always_comb
    case(aluop)
       2'b00: alucontrol <= 3'b010; // add
       2'b01: alucontrol <= 3'b110; // sub
       default: case({addSubType, funct3}) // R- or I-type
                   4'b0000: alucontrol <= 3'b010; // ADD
                   4'b1000: alucontrol <= 3'b110; // SUB
                   4'b0111: alucontrol <= 3'b000; // AND
                   4'b0110: alucontrol <= 3'b001; // OR
                   4'b0010: alucontrol <= 3'b111; // SLT
                   default: alucontrol <= 3'bxxx; // ???
       endcase
    endcase
    
endmodule
