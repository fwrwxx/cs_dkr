timescale 1ns/1ps

module alb_tb;

    reg [9:0] R, S;
    reg CI;
    reg [1:0] sel;
    wire [9:0] F;
    wire CO, VO, NO, ZO;

    // ????????????? ????????
    wire [9:0] normalized_F;
    reg normalize_en;

    alb uut (
        .R(R),
        .S(S),
        .CI(CI),
        .sel(sel),
        .F(F),
        .CO(CO),
        .VO(VO),
        .NO(NO),
        .ZO(ZO)
    );

    normalizer norm (
        .in(F),
        .enable(normalize_en),
        .out(normalized_F)
    );

    initial begin
        $display("ALB Simulation Start");
        $monitor("sel=%b R=%b S=%b CI=%b => F=%b normalized_F=%b CO=%b VO=%b NO=%b ZO=%b", 
                 sel, R, S, CI, F, normalized_F, CO, VO, NO, ZO);

        normalize_en = 0; // ???????????? ???????? ????????

        // ???? 1: NOT R | S
        sel = 2'b00; R = 10'b1100110011; S = 10'b1010101010; CI = 0; #10;

        // ????????? ????????????
        normalize_en = 1; #10;

        // ???????? ????????????
        normalize_en = 0; #10;

        // ???? 2: R + S + CI
        sel = 2'b01; R = 10'b0000001111; S = 10'b0000000001; CI = 1; normalize_en = 0; #10;

        normalize_en = 1; #10;

        normalize_en = 0; #10;

        // ???? 3: NOT (R ^ S)
        sel = 2'b10; R = 10'b1111000011; S = 10'b1010101010; CI = 0; normalize_en = 0; #10;

        normalize_en = 1; #10;

        normalize_en = 0; #10;

        // ???? 4: R - S - 1 + CI
        sel = 2'b11; R = 10'b1000000000; S = 10'b0000001111; CI = 1; normalize_en = 0; #10;

        normalize_en = 1; #10;

        $finish;
    end

endmodule
