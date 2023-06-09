`include "lfsr_structural.v"

module tb();
    reg clk;
    reg rst;
    reg init;
    reg[7:0] initial_data;
    wire[7:0] Output;

    integer tb_iter;
    toplevel block(.clk(clk), .rst(rst), .init(init), .initial_data(initial_data), .Output(Output));

    always
        #5 clk = ~clk;

    initial begin
        $dumpfile ("lfsr_structural.vcd");
        $dumpvars;

        clk = 0;
        rst = 0;
        block.bit0_out_synth_0 = 0;
        block.bit1_out_synth_0 = 0;
        block.bit2_out_synth_0 = 0;
        block.bit3_out_synth_0 = 0;
        block.bit4_out_synth_0 = 0;
        block.bit5_out_synth_0 = 0;
        block.bit6_out_synth_0 = 0;
        block.bit7_out_synth_0 = 0;
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd1;
        initial_data = 8'd165;

        #10
        init = 1'd0;
        initial_data = 8'd165;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd1;
        initial_data = 8'd165;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        init = 1'd0;
        initial_data = 8'd0;

        #10
        $finish;
    end
endmodule
