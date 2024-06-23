package alu_defs;
    parameter [2:0]
        ADD_SUB = 3'b000,
        SLL = 3'b001,
        SLT = 3'b010,
        SLTU = 3'b011,
        XOR = 3'b100,
        SRL_SRA = 3'b101,
        OR = 3'b110,
        AND = 3'b111,
        MUL = 3'b000,
        MULH = 3'b001,
        MULHSU = 3'b010,
        MULHU = 3'b011,
        DIV = 3'b100,
        DIVU = 3'b101,
        REM = 3'b110,
        REMU = 3'b111;
endpackage : alu_defs