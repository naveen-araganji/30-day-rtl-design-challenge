module d_latch_tb;
reg  i_d;
reg  i_en;
wire o_q;

// ---------- DUT Instantiation ----------
d_latch dut (
    .i_d  (i_d),
    .i_en (i_en),
    .o_q  (o_q)
);

// ---------- Stimulus ----------
initial begin
    
    // Enable low -> hold
    i_d = 1'b0; i_en = 1'b0; #10;

    // Enable high -> D=1
    i_d = 1'b1; i_en = 1'b1; #10;

    // Change D while enable
    i_d = 1'b0; i_en = 1'b1; #10;

    // Disable -> hold previous value
    i_d = 1'b1; i_en = 1'b0; #10;

    // Change D while disabled
    i_d = 1'b0; i_en = 1'b0; #10;

    // Enable
    i_d = 1'b1; i_en = 1'b1; #10;
    
    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_d=%b | i_en=%b | o_q=%b",
            $time, i_d, i_en, o_q);
end
    
endmodule