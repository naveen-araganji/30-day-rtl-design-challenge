`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 22
// Module Name : fifo_tb
// Description : Testbench for FIFO
//////////////////////////////////////////////////////////////////////////////////

module fifo_tb;

reg        i_clk;
reg        i_wr_en;
reg        i_rd_en;
reg [7:0]  i_data;

wire [7:0] o_data;
wire       o_full;
wire       o_empty;

// ---------- DUT Instantiation ----------
fifo dut (
    .i_clk   (i_clk),
    .i_wr_en (i_wr_en),
    .i_rd_en (i_rd_en),
    .i_data  (i_data),
    .o_data  (o_data),
    .o_full  (o_full),
    .o_empty (o_empty)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk   = 1'b0;
    i_wr_en = 1'b0;
    i_rd_en = 1'b0;
    i_data  = 8'd0;#10;

    // Write 10,20,30
    i_wr_en = 1'b1;
    i_data = 8'd10; #10;
    i_data = 8'd20; #10;
    i_data = 8'd30; #10;


    // Simultaneous Read + Write
    // Read 10, Write 40
    i_rd_en = 1'b1;
    i_data  = 8'd40;
    #10;

    // Stop Writing
    // Continue Reading
    i_wr_en = 1'b0;

    #30;

    // Stop Reading
    i_rd_en = 1'b0;

    #20;
    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | wr=%b | rd=%b | i_data=%d | o_data=%d | full=%b | empty=%b",
             $time, i_wr_en, i_rd_en, i_data, o_data, o_full, o_empty);
end

endmodule