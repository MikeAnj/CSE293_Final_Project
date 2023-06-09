// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, rst, init, initial_data, Output);
    input clk;
    input rst;
    input init;
    input[7:0] initial_data;
    output[7:0] Output;

    reg bit0_out_synth_0;
    reg bit1_out_synth_0;
    reg bit2_out_synth_0;
    reg bit3_out_synth_0;
    reg bit4_out_synth_0;
    reg bit5_out_synth_0;
    reg bit6_out_synth_0;
    reg bit7_out_synth_0;

    wire tmp52;
    wire tmp53;
    wire tmp54;
    wire tmp55;
    wire tmp56;
    wire tmp57;
    wire tmp58;
    wire tmp59;
    wire[7:0] tmp61;
    wire tmp63;
    wire tmp64;
    wire tmp66;
    wire tmp67;
    wire tmp69;
    wire tmp70;
    wire tmp71;
    wire tmp72;
    wire tmp74;
    wire tmp76;
    wire tmp77;
    wire tmp78;
    wire tmp79;
    wire tmp81;
    wire tmp82;
    wire tmp83;
    wire tmp84;
    wire tmp85;
    wire tmp86;
    wire tmp87;
    wire tmp88;
    wire tmp89;
    wire tmp90;
    wire tmp92;
    wire tmp93;
    wire tmp94;
    wire tmp95;
    wire tmp96;

    // Combinational
    assign Output = tmp61;
    assign tmp52 = {initial_data[0]};
    assign tmp53 = {initial_data[1]};
    assign tmp54 = {initial_data[2]};
    assign tmp55 = {initial_data[3]};
    assign tmp56 = {initial_data[4]};
    assign tmp57 = {initial_data[5]};
    assign tmp58 = {initial_data[6]};
    assign tmp59 = {initial_data[7]};
    assign tmp61 = {bit7_out_synth_0, bit6_out_synth_0, bit5_out_synth_0, bit4_out_synth_0, bit3_out_synth_0, bit2_out_synth_0, bit1_out_synth_0, bit0_out_synth_0};
    assign tmp63 = tmp92 | tmp66;
    assign tmp64 = bit6_out_synth_0 & tmp85;
    assign tmp66 = tmp56 & init;
    assign tmp67 = bit1_out_synth_0 ^ bit7_out_synth_0;
    assign tmp69 = tmp57 & init;
    assign tmp70 = tmp53 & init;
    assign tmp71 = tmp81 | tmp88;
    assign tmp72 = tmp59 & init;
    assign tmp74 = bit0_out_synth_0 & tmp85;
    assign tmp76 = tmp52 & init;
    assign tmp77 = tmp94 | tmp79;
    assign tmp78 = bit7_out_synth_0 & tmp85;
    assign tmp79 = tmp54 & init;
    assign tmp81 = tmp87 & tmp85;
    assign tmp82 = tmp74 | tmp70;
    assign tmp83 = tmp78 | tmp76;
    assign tmp84 = tmp64 | tmp72;
    assign tmp85 = ~init;
    assign tmp86 = bit4_out_synth_0 & tmp85;
    assign tmp87 = bit2_out_synth_0 ^ bit7_out_synth_0;
    assign tmp88 = tmp55 & init;
    assign tmp89 = tmp58 & init;
    assign tmp90 = tmp95 | tmp89;
    assign tmp92 = tmp93 & tmp85;
    assign tmp93 = bit3_out_synth_0 ^ bit7_out_synth_0;
    assign tmp94 = tmp67 & tmp85;
    assign tmp95 = bit5_out_synth_0 & tmp85;
    assign tmp96 = tmp86 | tmp69;

    // Registers
    always @(posedge clk)
    begin
        if (rst) begin
            bit0_out_synth_0 <= 0;
            bit1_out_synth_0 <= 0;
            bit2_out_synth_0 <= 0;
            bit3_out_synth_0 <= 0;
            bit4_out_synth_0 <= 0;
            bit5_out_synth_0 <= 0;
            bit6_out_synth_0 <= 0;
            bit7_out_synth_0 <= 0;
        end
        else begin
            bit0_out_synth_0 <= tmp83;
            bit1_out_synth_0 <= tmp82;
            bit2_out_synth_0 <= tmp77;
            bit3_out_synth_0 <= tmp71;
            bit4_out_synth_0 <= tmp63;
            bit5_out_synth_0 <= tmp96;
            bit6_out_synth_0 <= tmp90;
            bit7_out_synth_0 <= tmp84;
        end
    end

endmodule

