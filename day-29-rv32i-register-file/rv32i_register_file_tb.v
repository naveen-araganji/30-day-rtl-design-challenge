`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 29
// Module Name : rv32i_register_file_tb
// Description : Testbench for RV32I Register File
//////////////////////////////////////////////////////////////////////////////////

module rv32i_register_file_tb;

reg         i_clk;
reg         i_rst;
reg  [4:0]  i_rs1;
reg  [4:0]  i_rs2;
reg  [4:0]  i_rd;
reg         i_write_enable;
reg  [31:0] i_write_data;

wire [31:0] o_rs1_data;
wire [31:0] o_rs2_data;

// ---------- DUT Instantiation ----------
rv32i_register_file dut (
    .i_clk          (i_clk),
    .i_rst          (i_rst),
    .i_rs1          (i_rs1),
    .i_rs2          (i_rs2),
    .i_rd           (i_rd),
    .i_write_enable (i_write_enable),
    .i_write_data   (i_write_data),
    .o_rs1_data     (o_rs1_data),
    .o_rs2_data     (o_rs2_data)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk          = 1'b0;
    i_rst          = 1'b1;
    i_rs1          = 5'd0;
    i_rs2          = 5'd0;
    i_rd           = 5'd0;
    i_write_enable = 1'b0;
    i_write_data   = 32'd0;

    // Reset
    #10;
    i_rst = 1'b0;

    // -------------------------
    // Write x1 = 10
    // -------------------------
    i_rd           = 5'd1;
    i_write_data   = 32'd10;
    i_write_enable = 1'b1;
    #10;

    // -------------------------
    // Write x2 = 20
    // -------------------------
    i_rd         = 5'd2;
    i_write_data = 32'd20;
    #10;

    // -------------------------
    // Write x3 = 30
    // -------------------------
    i_rd         = 5'd3;
    i_write_data = 32'd30;
    #10;

    i_write_enable = 1'b0;

    // -------------------------
    // Read x1 and x2
    // -------------------------
    i_rs1 = 5'd1;
    i_rs2 = 5'd2;
    #10;

    // -------------------------
    // Read x2 and x3
    // -------------------------
    i_rs1 = 5'd2;
    i_rs2 = 5'd3;
    #10;

    // -------------------------
    // Attempt Write x0 = 100
    // -------------------------
    i_rd           = 5'd0;
    i_write_data   = 32'd100;
    i_write_enable = 1'b1;
    #10;

    i_write_enable = 1'b0;

    // -------------------------
    // Read x0 and x3
    // -------------------------
    i_rs1 = 5'd0;
    i_rs2 = 5'd3;
    #10;

    $finish;

end

// ---------- Monitor ----------
initial begin

    $monitor("Time=%0t | rs1=%0d rs2=%0d | rs1_data=%0d rs2_data=%0d | rd=%0d write_data=%0d we=%b",
             $time,i_rs1,i_rs2,o_rs1_data,o_rs2_data,i_rd,i_write_data,i_write_enable);

end

endmodule