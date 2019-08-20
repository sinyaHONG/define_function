/*
*移位乘法器，调用16位加法器IP
*/

module  crr_mul(
        input clk,
        input rst_n,
        input reg[7:0] mul_a,
        input reg[7:0]mul_b,
        output reg[15:0]mul_o
);


reg [15:0] add_a;
reg [15:0] add_b;
reg [15:0] add_b_r;
wire [15:0] add_o;
reg [7:0] cnt;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin	
        add_a <= 16'b0;
        add_b <= 16'b0;
		add_b_r <= 16'b0;
        cnt <= 8'b0;
    end
	else begin
		if (cnt > 8'b111) begin
			cnt <= 8'b0;
			mul_o <= add_o;
			add_a <= 16'b0;
			add_b <= 16'b0;
		end 
		else begin
			if(mul_b[cnt] == 1) begin 
				add_a <= {8'b0 , mul_a} << cnt;
			end
			else begin
				add_a <= 16'b0;
			end 
			cnt <= cnt + 1'b1; 
			add_b <= add_b_r;
			add_b_r <= add_o;	
		end 	
	end 
end 

add add_m(
    .a (add_a),
    .b (add_b),
    .c (add_o)
);

endmodule




