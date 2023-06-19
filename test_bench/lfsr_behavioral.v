// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

//module toplevel(clk, rst, data_in, init, data_out);
module lfsr_behavioral(clk, rst, data_in, init, data_out);

    input clk;
    input rst;
    input[7:0] data_in;
    input init;
    output[7:0] data_out;

    reg data_reg_synth_0;
    reg data_reg_synth_1;
    reg data_reg_synth_2;
    reg data_reg_synth_3;
    reg data_reg_synth_4;
    reg data_reg_synth_5;
    reg data_reg_synth_6;
    reg data_reg_synth_7;

    wire tmp31;
    wire tmp32;
    wire tmp33;
    wire tmp34;
    wire tmp35;
    wire tmp36;
    wire tmp37;
    wire tmp38;
    wire[7:0] tmp40;
    wire tmp42;
    wire tmp43;
    wire tmp44;
    wire tmp45;
    wire tmp46;
    wire tmp47;
    wire tmp48;
    wire tmp49;
    wire tmp50;
    wire tmp51;
    wire tmp52;
    wire tmp53;
    wire tmp54;
    wire tmp55;
    wire tmp56;
    wire tmp57;
    wire tmp58;
    wire tmp59;
    wire tmp60;
    wire tmp61;
    wire tmp62;
    wire tmp63;
    wire tmp64;
    wire tmp65;
    wire tmp66;
    wire tmp67;
    wire tmp68;
    wire tmp69;
    wire tmp70;
    wire tmp71;
    wire tmp72;
    wire tmp73;
    wire tmp74;
    wire tmp75;
    wire tmp76;
    wire tmp77;
    wire tmp78;
    wire tmp79;
    wire tmp80;
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
    wire tmp91;
    wire tmp92;
    wire tmp93;
    wire tmp94;
    wire tmp95;

    // Combinational
    assign data_out = tmp40;
    assign tmp31 = {data_in[0]};
    assign tmp32 = {data_in[1]};
    assign tmp33 = {data_in[2]};
    assign tmp34 = {data_in[3]};
    assign tmp35 = {data_in[4]};
    assign tmp36 = {data_in[5]};
    assign tmp37 = {data_in[6]};
    assign tmp38 = {data_in[7]};
    assign tmp40 = {data_reg_synth_7, data_reg_synth_6, data_reg_synth_5, data_reg_synth_4, data_reg_synth_3, data_reg_synth_2, data_reg_synth_1, data_reg_synth_0};
    assign tmp42 = tmp61 | tmp69;
    assign tmp43 = tmp62 | tmp70;
    assign tmp44 = tmp63 | tmp71;
    assign tmp45 = tmp64 | tmp72;
    assign tmp46 = tmp65 | tmp73;
    assign tmp47 = tmp66 | tmp74;
    assign tmp48 = tmp67 | tmp75;
    assign tmp49 = tmp68 | tmp76;
    assign tmp50 = ~tmp51;
    assign tmp51 = ~tmp86;
    assign tmp52 = data_reg_synth_2 ^ data_reg_synth_7;
    assign tmp53 = tmp77 | tmp87;
    assign tmp54 = tmp78 | tmp88;
    assign tmp55 = tmp79 | tmp89;
    assign tmp56 = tmp80 | tmp90;
    assign tmp57 = tmp81 | tmp91;
    assign tmp58 = tmp82 | tmp92;
    assign tmp59 = tmp83 | tmp93;
    assign tmp60 = tmp84 | tmp94;
    assign tmp61 = data_reg_synth_0 & tmp51;
    assign tmp62 = data_reg_synth_1 & tmp51;
    assign tmp63 = data_reg_synth_2 & tmp51;
    assign tmp64 = data_reg_synth_3 & tmp51;
    assign tmp65 = data_reg_synth_4 & tmp51;
    assign tmp66 = data_reg_synth_5 & tmp51;
    assign tmp67 = data_reg_synth_6 & tmp51;
    assign tmp68 = data_reg_synth_7 & tmp51;
    assign tmp69 = data_reg_synth_7 & tmp86;
    assign tmp70 = data_reg_synth_0 & tmp86;
    assign tmp71 = tmp85 & tmp86;
    assign tmp72 = tmp52 & tmp86;
    assign tmp73 = tmp95 & tmp86;
    assign tmp74 = data_reg_synth_4 & tmp86;
    assign tmp75 = data_reg_synth_5 & tmp86;
    assign tmp76 = data_reg_synth_6 & tmp86;
    assign tmp77 = tmp42 & tmp50;
    assign tmp78 = tmp43 & tmp50;
    assign tmp79 = tmp44 & tmp50;
    assign tmp80 = tmp45 & tmp50;
    assign tmp81 = tmp46 & tmp50;
    assign tmp82 = tmp47 & tmp50;
    assign tmp83 = tmp48 & tmp50;
    assign tmp84 = tmp49 & tmp50;
    assign tmp85 = data_reg_synth_1 ^ data_reg_synth_7;
    assign tmp86 = ~init;
    assign tmp87 = tmp31 & tmp51;
    assign tmp88 = tmp32 & tmp51;
    assign tmp89 = tmp33 & tmp51;
    assign tmp90 = tmp34 & tmp51;
    assign tmp91 = tmp35 & tmp51;
    assign tmp92 = tmp36 & tmp51;
    assign tmp93 = tmp37 & tmp51;
    assign tmp94 = tmp38 & tmp51;
    assign tmp95 = data_reg_synth_3 ^ data_reg_synth_7;

    // Registers
    always @(posedge clk)
    begin
        if (rst) begin
            data_reg_synth_0 <= 0;
            data_reg_synth_1 <= 0;
            data_reg_synth_2 <= 0;
            data_reg_synth_3 <= 0;
            data_reg_synth_4 <= 0;
            data_reg_synth_5 <= 0;
            data_reg_synth_6 <= 0;
            data_reg_synth_7 <= 0;
        end
        else begin
            data_reg_synth_0 <= tmp53;
            data_reg_synth_1 <= tmp54;
            data_reg_synth_2 <= tmp55;
            data_reg_synth_3 <= tmp56;
            data_reg_synth_4 <= tmp57;
            data_reg_synth_5 <= tmp58;
            data_reg_synth_6 <= tmp59;
            data_reg_synth_7 <= tmp60;
        end
    end

endmodule

