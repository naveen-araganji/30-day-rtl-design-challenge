`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 27
// Module Name : spi_master_tb
// Description : Testbench for SPI Master
//////////////////////////////////////////////////////////////////////////////////

module spi_master_tb;

reg        i_clk;
reg        i_start;
reg [7:0]  i_data;

wire       o_sclk;
wire       o_mosi;
wire       o_ss;
wire       o_busy;

// ---------- DUT Instantiation ----------
spi_master dut (
    .i_clk   (i_clk),
    .i_start (i_start),
    .i_data  (i_data),
    .o_sclk  (o_sclk),
    .o_mosi  (o_mosi),
    .o_ss    (o_ss),
    .o_busy  (o_busy)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk   = 1'b0;
    i_start = 1'b0;
    i_data  = 8'h00;

    // -------------------------
    // Transfer E5
    // -------------------------
    #20;

    i_data  = 8'hE5;
    i_start = 1'b1;

    #10;
    i_start = 1'b0;

    // Wait for transfer completion
    #200;

    $finish;

end

// ---------- Monitor ----------
initial begin

    $monitor("Time=%0t | start=%b | data=%h | sclk=%b | mosi=%b | ss=%b | busy=%b",
              $time,i_start,i_data,o_sclk,o_mosi,o_ss,o_busy);

end

endmodule