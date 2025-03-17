`timescale 10ns / 100ps

module testbench;

    reg clk_tb;
    reg reset_tb;
    reg inbits_tb;
    wire detect;

    // Clock generation
    initial begin
        clk_tb = 0;
        forever #10 clk_tb = ~clk_tb; // Toggle clock every 10ns
    end

    // Reset generation
    initial begin
        reset_tb = 1'b1;
        #15 reset_tb = 1'b0; // Release reset after 15ns
    end

    // Stimulus for inbits_tb
    initial begin
        inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 1;
        #20 inbits_tb = 0;
        #20 inbits_tb = 0;
        #100; // Wait to observe behavior
        $finish;
    end

    // Instantiate the DUT (Device Under Test)
    pair_detect pair_detect_inst (
        .clk(clk_tb),
        .inbits(inbits_tb),
        .detect(detect),
        .reset(reset_tb)
    );

    // Generate waveform dump for GTKWave
    initial begin
        $dumpfile("pair_detect_tb.vcd");
        $dumpvars(0, testbench);
    end

endmodule
