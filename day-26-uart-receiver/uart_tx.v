`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 25
// Module Name : uart_tx
// Description : UART Transmitter with Baud Generator
//////////////////////////////////////////////////////////////////////////////////

module uart_tx #(
    parameter BAUD_DIV = 4
)(
    input             i_clk,
    input             i_tx_start,
    input      [7:0]  i_tx_data,

    output reg        o_tx,
    output reg        o_tx_busy
);

localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] state;

reg [7:0] shift_reg;
reg [2:0] bit_count;
reg [15:0] baud_count;

initial begin
    state      = IDLE;
    shift_reg  = 8'd0;
    bit_count  = 3'd0;
    baud_count = 16'd0;

    o_tx       = 1'b1;
    o_tx_busy  = 1'b0;
end

always @(posedge i_clk) begin

    case(state)

        // -------------------------
        // IDLE
        // -------------------------
        IDLE : begin

            o_tx <= 1'b1;
            o_tx_busy <= 1'b0;

            baud_count <= 0;

            if(i_tx_start) begin
                shift_reg <= i_tx_data;
                bit_count <= 0;

                o_tx_busy <= 1'b1;
                state <= START;
            end

        end

        // -------------------------
        // START BIT
        // -------------------------
        START : begin

            o_tx <= 1'b0;

            if(baud_count == BAUD_DIV-1) begin
                baud_count <= 0;
                state <= DATA;
            end
            else begin
                baud_count <= baud_count + 1'b1;
            end

        end

        // -------------------------
        // DATA BITS
        // -------------------------
        DATA : begin

            o_tx <= shift_reg[0];

            if(baud_count == BAUD_DIV-1) begin

                baud_count <= 0;

                shift_reg <= shift_reg >> 1'b1;

                if(bit_count == 3'd7)
                    state <= STOP;

                bit_count <= bit_count + 1'b1;

            end
            else begin
                baud_count <= baud_count + 1'b1;
            end

        end

        // -------------------------
        // STOP BIT
        // -------------------------
        STOP : begin

            o_tx <= 1'b1;

            if(baud_count == BAUD_DIV-1) begin

                baud_count <= 0;
                o_tx_busy <= 1'b0;
                state <= IDLE;

            end
            else begin
                baud_count <= baud_count + 1'b1;
            end

        end

    endcase

end

endmodule