`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 23
// Module Name : register_file_tb
// Description : Testbench for 4x8 Register File
//////////////////////////////////////////////////////////////////////////////////

module register_file_tb;
reg        i_clk;
reg        i_wr_en;
reg  [1:0] i_wr_addr;
reg  [7:0] i_wr_data;
reg  [1:0] i_rd_addr1;
reg  [1:0] i_rd_addr2;
wire [7:0] o_rd_data1;
wire [7:0] o_rd_data2;

// ---------- DUT Instantiation ----------
register_file dut (
    .i_clk      (i_clk),
    .i_wr_en    (i_wr_en),
    .i_wr_addr  (i_wr_addr),
    .i_wr_data  (i_wr_data),
    .i_rd_addr1 (i_rd_addr1),
    .i_rd_addr2 (i_rd_addr2),
    .o_rd_data1 (o_rd_data1),
    .o_rd_data2 (o_rd_data2)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    i_wr_en = 1'b0;
    i_wr_addr = 2'd0;
    i_wr_data = 8'd0;
    i_rd_addr1 = 2'd0;
    i_rd_addr2 = 2'd0; #10;

    // Write operation
    i_wr_en = 1'b1;

    i_wr_addr = 2'b00;
    i_wr_data = 8'd10; #10;

    i_wr_addr = 2'b01;
    i_wr_data = 8'd20; #10;
    
    i_wr_addr = 2'b10;
    i_wr_data = 8'd30; #10;

    i_wr_addr = 2'b11;
    i_wr_data = 8'd40; #10;

    // Read R0 and R1
    i_wr_en = 1'b0;
    i_rd_addr1 = 2'b00;
    i_rd_addr2 = 2'b01; #10;

    // Read R2 and R3
    i_wr_en = 1'b0;
    i_rd_addr1 = 2'b10;
    i_rd_addr2 = 2'b11; #10;

    // Read R0 and R3
    i_wr_en = 1'b0;
    i_rd_addr1 = 2'b00;
    i_rd_addr2 = 2'b11; #10;

    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_wr_en=%b | i_wr_addr=%b | i_wr_data=%d | i_rd_addr1=%b | i_rd_addr2=%b | o_rd_data1=%d | o_rd_data2=%d",
            $time, i_clk, i_wr_en, i_wr_addr, i_wr_data, i_rd_addr1, i_rd_addr2, o_rd_data1, o_rd_data2);
end
    
endmodule