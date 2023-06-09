`include "lfsr_behavioral.v"

module tb();
    reg clk;
    reg rst;
    reg[7:0] data_in;
    reg init;
    wire[7:0] data_out;

    integer tb_iter;
    toplevel block(.clk(clk), .rst(rst), .data_in(data_in), .init(init), .data_out(data_out));

    always
        #5 clk = ~clk;

    initial begin
        $dumpfile ("lfsr_behavioral.vcd");
        $dumpvars;

        clk = 0;
        rst = 0;
        block.data_reg_synth_0 = 0;
        block.data_reg_synth_1 = 0;
        block.data_reg_synth_2 = 0;
        block.data_reg_synth_3 = 0;
        block.data_reg_synth_4 = 0;
        block.data_reg_synth_5 = 0;
        block.data_reg_synth_6 = 0;
        block.data_reg_synth_7 = 0;
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd165;
        init = 1'd1;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd165;
        init = 1'd1;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        data_in = 8'd0;
        init = 1'd0;

        #10
        $finish;
    end
endmodule
