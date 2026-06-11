`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 26
// Module Name : uart_tx_rx_tb
// Description : UART TX -> UART RX Verification
//////////////////////////////////////////////////////////////////////////////////

module uart_tx_rx_tb;

reg        i_clk;
reg        i_tx_start;
reg [7:0]  i_tx_data;

wire       tx_line;

wire [7:0] o_rx_data;
wire       o_rx_valid;

// ---------- UART TX ----------
uart_tx #(
    .BAUD_DIV(4)
)
tx_inst (
    .i_clk(i_clk),
    .i_tx_start(i_tx_start),
    .i_tx_data(i_tx_data),
    .o_tx(tx_line),
    .o_tx_busy()
);

// ---------- UART RX ----------
uart_rx #(
    .BAUD_DIV(4)
)
rx_inst (
    .i_clk(i_clk),
    .i_rx(tx_line),
    .o_rx_data(o_rx_data),
    .o_rx_valid(o_rx_valid)
);

// ---------- Clock ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk      = 0;
    i_tx_start = 0;
    i_tx_data  = 8'h00;

    #20;

    // Send A5
    i_tx_data  = 8'hA5;
    i_tx_start = 1'b1;

    #10;
    i_tx_start = 1'b0;

    #1000;

    $finish;

end

// ---------- Monitor ----------
initial begin

    $monitor("Time=%0t | TX_Data=%h | RX_Data=%h | RX_Valid=%b",
             $time,i_tx_data,o_rx_data,o_rx_valid);

end

endmodule