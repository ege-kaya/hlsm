module datapath(
    output reg signed [31:0] max,
    output reg signed [31:0] min,
    input wire signed [31:0] in,
    input wire reg_clr,
    input wire reg_ld,
    input wire max_clr,
    input wire max_ld,
    input wire min_clr,
    input wire min_ld,
    input wire clk,
    output reg A_lt_B,
    output reg C_gt_D
);

reg signed [31:0] register;

always @(posedge clk) begin
    if(reg_ld == 1) register <= in;
    if($signed(register) < $signed(min)) A_lt_B = 1;
    else A_lt_B = 0;
    if($signed(register) > $signed(max)) C_gt_D = 1;
    else C_gt_D = 0;
    if(min_ld == 1) min <= register;
    if(min_clr == 1) min <= 32'b01111111111111111111111111111111;
    if(max_ld == 1) max <= register;
    if(max_clr == 1) max <= 32'b10000000000000000000000000000000;
end

endmodule