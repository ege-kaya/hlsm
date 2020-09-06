module controller(
    output reg reg_clr,
    output reg reg_ld,
    output reg max_clr,
    output reg max_ld,
    output reg min_clr,
    output reg min_ld,
    input wire rst,
    input wire A_lt_B,
    input wire C_gt_D,
    input wire clk
);
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] current_state;
reg [1:0] next_state;

initial begin
    current_state = S0;
end

// Outputs
always @(*) begin
    case(current_state)
    S0: begin
	reg_clr = 0;
	reg_ld = 1;
	max_clr = 1;
	max_ld = 0;
        min_clr = 1;
	min_ld = 0;
    end
    S1: begin
	reg_clr = 0;
	reg_ld = 1;
	max_clr = 0;
	max_ld = 0;
        min_clr = 0;
	min_ld = 0;
    end
    S2: begin
	reg_clr = 0;
	reg_ld = 1;
	max_clr = 0;
	max_ld = 0;
        min_clr = 0;
	min_ld = 1;
    end
    S3: begin
	reg_clr = 0;
	reg_ld = 1;
	max_clr = 0;
	max_ld = 1;
        min_clr = 0;
	min_ld = 0;
    end
    endcase
end


// state transitions
always @(*) begin
    case(current_state)
    S0: begin
        if(rst == 1) next_state = S0;
	else next_state = S1;
    end
    S1: begin
	if(rst == 1) next_state = S0;
        else if((A_lt_B == 1) && (rst == 0)) next_state = S2;
	else if((C_gt_D == 1) && (rst == 0)) next_state = S3;
	else next_state = S1;
    end
    S2: begin
        if(rst == 1) next_state = S0;
        else if((A_lt_B == 1) && (rst == 0)) next_state = S2;
	else if((C_gt_D == 1) && (rst == 0)) next_state = S3;
	else next_state = S1;
    end
    S3: begin
        if(rst == 1) next_state = S0;
        else if((A_lt_B == 1) && (rst == 0)) next_state = S2;
	else if((C_gt_D == 1) && (rst == 0)) next_state = S3;
	else next_state = S1;
    end
    endcase
end


always @(posedge clk) begin
    current_state <= next_state; 
end

endmodule