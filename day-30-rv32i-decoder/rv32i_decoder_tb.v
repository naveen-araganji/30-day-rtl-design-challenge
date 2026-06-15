`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 30
// Module Name : rv32i_decoder_tb
// Description : Testbench for RV32I Instruction Decoder
//////////////////////////////////////////////////////////////////////////////////

module rv32i_decoder_tb;

reg  [6:0] i_opcode;
reg  [2:0] i_func3;
reg        i_func7;

wire       o_reg_wr_en;
wire [2:0] o_imm_type;
wire       o_adder_src;
wire       o_alu_src;
wire [3:0] o_alu_control;
wire       o_dm_wr_en;
wire [2:0] o_branch_cond;
wire       o_load_unsigned;
wire [1:0] o_load_size;
wire [2:0] o_result_src;

// ---------- DUT ----------
rv32i_decoder dut (

    .i_opcode         (i_opcode),
    .i_func3          (i_func3),
    .i_func7          (i_func7),

    .o_reg_wr_en      (o_reg_wr_en),
    .o_imm_type       (o_imm_type),
    .o_adder_src      (o_adder_src),
    .o_alu_src        (o_alu_src),
    .o_alu_control    (o_alu_control),
    .o_dm_wr_en       (o_dm_wr_en),
    .o_branch_cond    (o_branch_cond),
    .o_load_unsigned  (o_load_unsigned),
    .o_load_size      (o_load_size),
    .o_result_src     (o_result_src)

);

// ---------- Stimulus ----------
initial begin

    // =====================================
    // R-Type ADD
    // =====================================
    i_opcode = 7'b0110011;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // R-Type SUB
    // =====================================
    i_opcode = 7'b0110011;
    i_func3  = 3'b000;
    i_func7  = 1'b1;
    #10;

    // =====================================
    // I-Type ADDI
    // =====================================
    i_opcode = 7'b0010011;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // LW
    // =====================================
    i_opcode = 7'b0000011;
    i_func3  = 3'b010;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // SW
    // =====================================
    i_opcode = 7'b0100011;
    i_func3  = 3'b010;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // BEQ
    // =====================================
    i_opcode = 7'b1100011;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // BNE
    // =====================================
    i_opcode = 7'b1100011;
    i_func3  = 3'b001;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // JAL
    // =====================================
    i_opcode = 7'b1101111;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // JALR
    // =====================================
    i_opcode = 7'b1100111;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // LUI
    // =====================================
    i_opcode = 7'b0110111;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    // =====================================
    // AUIPC
    // =====================================
    i_opcode = 7'b0010111;
    i_func3  = 3'b000;
    i_func7  = 1'b0;
    #10;

    $finish;

end

// ---------- Monitor ----------
initial begin

$monitor("Time=%0t Opcode=%b Func3=%b Func7=%b | RegWr=%b ImmType=%b ALUSrc=%b ALUCtrl=%b DMWr=%b Branch=%b ResultSrc=%b",
        $time,i_opcode,i_func3,i_func7,o_reg_wr_en,o_imm_type,o_alu_src,o_alu_control,o_dm_wr_en,o_branch_cond,o_result_src);

end

endmodule