`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//      This test-bench has been provided to me as a student of CSEx25
//      I tweaked it so that it works for the PyRTL generated Verilog code
// 
//////////////////////////////////////////////////////////////////////////////////


module lfsr_tb;

    reg clk, res, res_n;
    reg [7:0] data_in;
    wire [7:0] data_out_struct;
    wire [7:0] data_out_behav;
    wire init;
    
    integer i, error_struct, error_behav;
    integer expected_lfsr [0:9];
    
    //Instantiate both models
    lfsr_structural dut_struct(
                        .clk(clk),
                        .rst(res),
                        .init(init),
                        .initial_data(data_in),
                        .Output(data_out_struct)
                        );

//module lfsr_behavioral(clk, rst, init, data_in, data_out);
    lfsr_behavioral dut_behav(
                        .clk(clk),
                        .rst(res),
                        .data_in(data_in),
                        .init(init),
                        .data_out(data_out_behav)
                        );    

    // Set the clock to always toggle with a delay
    always begin
        #200 clk = !clk; 
    end
    
    initial begin
        //Array initialization is verbose in Verilog
        expected_lfsr[0] = 'h57;    //87
        expected_lfsr[1] = 'hae;    //174
        expected_lfsr[2] = 'h41;
        expected_lfsr[3] = 'h82;
        expected_lfsr[4] = 'h19;
        expected_lfsr[5] = 'h32;
        expected_lfsr[6] = 'h64;
        expected_lfsr[7] = 'hc8;
        expected_lfsr[8] = 'h8d;
        expected_lfsr[9] = 'h07;
        // Set initial clock, data, and reset
        clk = 'b0;
        res = 'b0;      // THIS WAS CHANGED FROM res_n TO res
        data_in = 'b1010_0101;

        @(posedge clk);
        @(negedge clk);
        // Stop the reset after at least 1 clock positive edge.
        res_n = 'b1;
        @(posedge clk);

        error_struct = 0; 
        error_behav = 0;
        // Wait 10 clock cycles and stop simulation
        for(i = 0; i < 10; i = i+1) begin
            @(posedge clk);
            // Check the output at all cycles
            if(data_out_struct != expected_lfsr[i]) begin
                $display("Error with structural LFSR output at cycle %d", i);
                error_struct = error_struct+1;
            end    

            if(data_out_behav != expected_lfsr[i]) begin
                $display("Error with behavioral LFSR output at cycle %d", i);
                error_behav = error_behav+1;
            end
        end    
            
        if(error_struct != 0)
            $display("Structural LFSR failed");
        else
            $display("Structural LFSR passed");
            
        if(error_behav != 0)
            $display("Behavioral LFSR failed");
        else
            $display("Behavioral LFSR passed");   
            
        $finish;
    end

endmodule
