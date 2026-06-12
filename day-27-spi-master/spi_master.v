`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 27
// Module Name : spi_master
// Description : 8-bit SPI Master (Mode 0)
//               MSB First Transmission
//////////////////////////////////////////////////////////////////////////////////

module spi_master (

    input             i_clk,
    input             i_start,
    input      [7:0]  i_data,

    output reg        o_sclk,
    output reg        o_mosi,
    output reg        o_ss,
    output reg        o_busy

);

reg [7:0] shift_reg;
reg [2:0] bit_count;

// ---------- Initialization ----------
initial begin

    shift_reg = 8'd0;
    bit_count = 3'd0;

    o_sclk = 1'b0;
    o_mosi = 1'b0;
    o_ss   = 1'b1;
    o_busy = 1'b0;

end

// ---------- SPI Master ----------
always @(posedge i_clk) begin

    // Start Transfer
    if (i_start && !o_busy) begin

        shift_reg <= i_data;
        bit_count <= 3'd0;

        o_busy <= 1'b1;
        o_ss   <= 1'b0;
        o_sclk <= 1'b0;

        // First bit (MSB)
        o_mosi <= i_data[7];

    end

    // Transfer Active
    else if (o_busy) begin

        o_sclk <= ~o_sclk;

        // Shift data on falling edge
        if (o_sclk == 1'b1) begin

            shift_reg <= shift_reg << 1;

            bit_count <= bit_count + 1'b1;

            if (bit_count < 3'd7)
                o_mosi <= shift_reg[6];

            else begin
                o_busy <= 1'b0;
                o_ss   <= 1'b1;
                o_sclk <= 1'b0;
            end

        end

    end

end

endmodule