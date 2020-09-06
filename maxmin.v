module maxmin(
    output wire signed [31:0] max,
    output wire signed [31:0] min,
    input wire signed [31:0] in,
    input wire rst,
    input wire clk
);

wire __reg_clr;
wire __reg_ld;
wire __max_clr;
wire __max_ld;
wire __min_clr;
wire __min_ld;
wire __A_lt_B;
wire __C_gt_D;

controller ctrl(
    .reg_clr(__reg_clr),
    .reg_ld(__reg_ld),
    .max_clr(__max_clr),
    .max_ld(__max_ld),
    .min_clr(__min_clr),
    .min_ld(__min_ld),
    .rst(rst),
    .A_lt_B(__A_lt_B),
    .C_gt_D(__C_gt_D),
    .clk(clk)
);

datapath dp(
    .max(max),
    .min(min),
    .in(in),
    .reg_clr(__reg_clr),
    .reg_ld(__reg_ld),
    .max_clr(__max_clr),
    .max_ld(__max_ld),
    .min_clr(__min_clr),
    .min_ld(__min_ld),
    .clk(clk),
    .A_lt_B(__A_lt_B),
    .C_gt_D(__C_gt_D)
);

endmodule