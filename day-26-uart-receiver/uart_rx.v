`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 26
// Module Name : uart_rx
// Description : UART Receiver with Baud Generator
//////////////////////////////////////////////////////////////////////////////////

module uart_rx #(

    parameter BAUD_DIV = 4

)(

    input            i_clk,
    input            i_rx,

    output reg [7:0] o_rx_data,
    output reg       o_rx_valid

);

// ---------- State Encoding ----------
localparam IDLE  = 2'b00;
localparam START = 2'b01;
localparam DATA  = 2'b10;
localparam STOP  = 2'b11;

reg [1:0] state;

reg [7:0] shift_reg;
reg [2:0] bit_count;
reg [15:0] baud_count;

// ---------- Initialization ----------
initial begin

    state      = IDLE;
    shift_reg  = 8'd0;
    bit_count  = 3'd0;
    baud_count = 16'd0;

    o_rx_data  = 8'd0;
    o_rx_valid = 1'b0;

end

// ---------- UART Receiver ----------
always @(posedge i_clk) begin

    case(state)

        // -------------------------
        // IDLE
        // -------------------------
        IDLE : begin

            o_rx_valid <= 1'b0;
            baud_count <= 16'd0;

            // Detect Start Bit
            if(i_rx == 1'b0)
                state <= START;

        end

        // -------------------------
        // START BIT
        // -------------------------
        START : begin

            // Wait half bit time to move
            // near the center of the first data bit
            if(baud_count == (BAUD_DIV/2)-1) begin

                baud_count <= 16'd0;
                bit_count  <= 3'd0;

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

            if(baud_count == BAUD_DIV-1) begin

                baud_count <= 16'd0;

                // LSB First Reception
                shift_reg[bit_count] <= i_rx;

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

            if(baud_count == BAUD_DIV-1) begin

                baud_count <= 16'd0;

                // Stop Bit Check
                if(i_rx == 1'b1) begin

                    o_rx_data  <= shift_reg;
                    o_rx_valid <= 1'b1;

                end

                state <= IDLE;

            end
            else begin
                baud_count <= baud_count + 1'b1;
            end

        end

    endcase

end

endmodule