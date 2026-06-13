`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 28
// Module Name : spi_slave
// Description : SPI Slave (8-bit, MOSI Only)
//////////////////////////////////////////////////////////////////////////////////

module spi_slave (

    input             i_sclk,
    input             i_ss,
    input             i_mosi,

    output reg [7:0]  o_rx_data,
    output reg        o_rx_valid

);

reg [7:0] shift_reg;
reg [2:0] bit_count;

// ---------- Initialization ----------
initial begin

    shift_reg  = 8'd0;
    bit_count  = 3'd0;

    o_rx_data  = 8'd0;
    o_rx_valid = 1'b0;

end

// ---------- SPI Slave ----------
always @(posedge i_sclk) begin

    // Slave Selected
    if (!i_ss) begin

        // Shift incoming bit
        shift_reg <= {shift_reg[6:0], i_mosi};

        if (bit_count == 3'd7) begin

            o_rx_data  <= {shift_reg[6:0], i_mosi};
            o_rx_valid <= 1'b1;

            bit_count <= 3'd0;

        end
        else begin

            bit_count  <= bit_count + 1'b1;
            o_rx_valid <= 1'b0;

        end

    end
    else begin

        bit_count  <= 3'd0;
        o_rx_valid <= 1'b0;

    end

end

endmodule