`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 30
// Module Name : rv32i_decoder
// Description : RV32I Single Cycle / Pipeline Decoder
//////////////////////////////////////////////////////////////////////////////////

module rv32i_decoder (

    input  [6:0] i_opcode,
    input  [2:0] i_func3,
    input        i_func7,

    output reg       o_reg_wr_en,
    output reg [2:0] o_imm_type,
    output reg       o_adder_src,
    output reg       o_alu_src,
    output reg [3:0] o_alu_control,
    output reg       o_dm_wr_en,
    output reg [2:0] o_branch_cond,
    output reg       o_load_unsigned,
    output reg [1:0] o_load_size,
    output reg [2:0] o_result_src

);

always @(*) begin

    // ---------- Default Outputs ----------
    o_reg_wr_en      = 1'b0;
    o_imm_type       = 3'b000;
    o_adder_src      = 1'b0;
    o_alu_src        = 1'b0;
    o_alu_control    = 4'b0000;
    o_dm_wr_en       = 1'b0;
    o_branch_cond    = 3'b000;
    o_load_unsigned  = 1'b0;
    o_load_size      = 2'b00;
    o_result_src     = 3'b000;

    case (i_opcode)

    // =========================================================
    // R-Type Instructions
    // =========================================================
    7'b0110011: begin

        o_reg_wr_en = 1'b1;
        o_result_src = 3'b000;

        case (i_func3)

            3'b000: begin
                if (i_func7)
                    o_alu_control = 4'b0001; // SUB
                else
                    o_alu_control = 4'b0000; // ADD
            end

            3'b111: o_alu_control = 4'b0010; // AND
            3'b110: o_alu_control = 4'b0011; // OR
            3'b100: o_alu_control = 4'b0100; // XOR
            3'b001: o_alu_control = 4'b0101; // SLL

            3'b101: begin
                if (i_func7)
                    o_alu_control = 4'b0111; // SRA
                else
                    o_alu_control = 4'b0110; // SRL
            end

            3'b010: o_alu_control = 4'b1000; // SLT
            3'b011: o_alu_control = 4'b1001; // SLTU

            default: o_alu_control = 4'b0000;

        endcase
    end

    // =========================================================
    // I-Type ALU Instructions
    // =========================================================
    7'b0010011: begin

        o_reg_wr_en = 1'b1;
        o_alu_src   = 1'b1;
        o_imm_type  = 3'b000;

        case (i_func3)

            3'b000: o_alu_control = 4'b0000; // ADDI
            3'b111: o_alu_control = 4'b0010; // ANDI
            3'b110: o_alu_control = 4'b0011; // ORI
            3'b100: o_alu_control = 4'b0100; // XORI
            3'b001: o_alu_control = 4'b0101; // SLLI

            3'b101: begin
                if (i_func7)
                    o_alu_control = 4'b0111; // SRAI
                else
                    o_alu_control = 4'b0110; // SRLI
            end

            3'b010: o_alu_control = 4'b1000; // SLTI
            3'b011: o_alu_control = 4'b1001; // SLTIU

            default: o_alu_control = 4'b0000;

        endcase
    end

    // =========================================================
    // Load Instructions
    // =========================================================
    7'b0000011: begin

        o_reg_wr_en   = 1'b1;
        o_alu_src     = 1'b1;
        o_imm_type    = 3'b000;
        o_alu_control = 4'b0000;
        o_result_src  = 3'b001;

        case (i_func3)

            3'b000: begin
                o_load_size = 2'b00;
                o_load_unsigned = 1'b0;
            end

            3'b001: begin
                o_load_size = 2'b01;
                o_load_unsigned = 1'b0;
            end

            3'b010: begin
                o_load_size = 2'b10;
                o_load_unsigned = 1'b0;
            end

            3'b100: begin
                o_load_size = 2'b00;
                o_load_unsigned = 1'b1;
            end

            3'b101: begin
                o_load_size = 2'b01;
                o_load_unsigned = 1'b1;
            end

        endcase
    end

    // =========================================================
    // Store Instructions
    // =========================================================
    7'b0100011: begin

        o_alu_src     = 1'b1;
        o_imm_type    = 3'b001;
        o_alu_control = 4'b0000;
        o_dm_wr_en    = 1'b1;

    end

    // =========================================================
    // Branch Instructions
    // =========================================================
    7'b1100011: begin

        o_imm_type = 3'b010;

        case (i_func3)

            3'b000: o_branch_cond = 3'b001;
            3'b001: o_branch_cond = 3'b010;
            3'b100: o_branch_cond = 3'b011;
            3'b101: o_branch_cond = 3'b100;
            3'b110: o_branch_cond = 3'b101;
            3'b111: o_branch_cond = 3'b110;

        endcase
    end

    // =========================================================
    // JAL
    // =========================================================
    7'b1101111: begin

        o_reg_wr_en  = 1'b1;
        o_imm_type   = 3'b100;
        o_result_src = 3'b010;

    end

    // =========================================================
    // JALR
    // =========================================================
    7'b1100111: begin

        o_reg_wr_en  = 1'b1;
        o_alu_src    = 1'b1;
        o_adder_src  = 1'b1;
        o_imm_type   = 3'b000;
        o_result_src = 3'b010;

    end

    // =========================================================
    // LUI
    // =========================================================
    7'b0110111: begin

        o_reg_wr_en  = 1'b1;
        o_imm_type   = 3'b011;
        o_result_src = 3'b011;

    end

    // =========================================================
    // AUIPC
    // =========================================================
    7'b0010111: begin

        o_reg_wr_en   = 1'b1;
        o_imm_type    = 3'b011;
        o_alu_src     = 1'b1;
        o_alu_control = 4'b0000;
        o_result_src  = 3'b000;

    end

    endcase

end

endmodule