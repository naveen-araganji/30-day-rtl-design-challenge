`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 25
// Module Name : uart_tx_tb
// Description : Testbench for UART Transmitter
//////////////////////////////////////////////////////////////////////////////////

module uart_tx_tb;

reg        i_clk;
reg        i_tx_start;
reg [7:0]  i_tx_data;

wire       o_tx;
wire       o_tx_busy;

// ---------- DUT ----------
uart_tx #(
    .BAUD_DIV(4)
)
dut (
    .i_clk      (i_clk),
    .i_tx_start (i_tx_start),
    .i_tx_data  (i_tx_data),
    .o_tx       (o_tx),
    .o_tx_busy  (o_tx_busy)
);

// ---------- Clock ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk      = 0;
    i_tx_start = 0;
    i_tx_data  = 8'h00;

    // Send A5
    #20;
    i_tx_data  = 8'hA5;
    i_tx_start = 1'b1;

    #10;
    i_tx_start = 1'b0;

    // Wait until transmission completes
    #450;

    $finish;

end

// ---------- Monitor ----------
initial begin

    $monitor("Time=%0t | Start=%b | Data=%h | TX=%b | Busy=%b",
             $time,i_tx_start,i_tx_data,o_tx,o_tx_busy);

end

endmodule