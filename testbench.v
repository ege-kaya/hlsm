module testbench();

reg rst;
reg [31:0] in;
reg clk;

wire [31:0] __max;
wire [31:0] __min;

maxmin mm(
    .max(__max),
    .min(__min),
    .in(in),
    .rst(rst),
    .clk(clk)
);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, testbench);

    clk = 0;
    rst = 1;
    in = 32'b0101010101111101101011101011111;
    #10;
    rst = 0;
    in = 32'b0000000000000000000000000000000;
    #10;
    in = 32'b0000000000000101111101011111111;
    #10;
    in = 32'b1000000000000101111101011111111;
    #10;
    in = 32'b0000000001000101111101011111111;
    #10;
    in = 32'b0000000000000000000000000000001;
    #10;
    in = 32'b1111111111111111111111111111111;
    #10;
    in = 32'b1000000000000000000000000000000;
    #10;
    in = 32'b0111111111111111111111111111111;
    $finish(0);
end



always begin
    #5 clk = !clk;
end

endmodule