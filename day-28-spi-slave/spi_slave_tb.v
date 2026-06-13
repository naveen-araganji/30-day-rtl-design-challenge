`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 28
// Module Name : spi_slave_tb
// Description : Testbench for SPI Slave
//////////////////////////////////////////////////////////////////////////////////

module spi_slave_tb;

reg        i_sclk;
reg        i_ss;
reg        i_mosi;

wire [7:0] o_rx_data;
wire       o_rx_valid;

// DUT Instantiation
spi_slave dut (
    .i_sclk    (i_sclk),
    .i_ss      (i_ss),
    .i_mosi    (i_mosi),
    .o_rx_data (o_rx_data),
    .o_rx_valid(o_rx_valid)
);

// SPI Clock Generation
initial begin
    i_sclk = 0;
    forever #5 i_sclk = ~i_sclk;
end

// Stimulus
initial begin

    i_ss   = 1'b1;
    i_mosi = 1'b0;

    // Wait before transmission
    #20;

    // Select Slave
    i_ss = 1'b0;

    // Send E5 = 11100101 (MSB First)

    i_mosi = 1'b1; #10;   // Bit7
    i_mosi = 1'b1; #10;   // Bit6
    i_mosi = 1'b1; #10;   // Bit5
    i_mosi = 1'b0; #10;   // Bit4
    i_mosi = 1'b0; #10;   // Bit3
    i_mosi = 1'b1; #10;   // Bit2
    i_mosi = 1'b0; #10;   // Bit1
    i_mosi = 1'b1; #10;   // Bit0

    // Deselect Slave
    i_ss = 1'b1;

    #50;

    $finish;

end

// Monitor
initial begin

    $monitor("Time=%0t | SS=%b | MOSI=%b | RX_DATA=%h | RX_VALID=%b",
              $time,i_ss,i_mosi,o_rx_data,o_rx_valid);

end

endmodule