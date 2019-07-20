module define_function(
		input clk,
		input rst_n,
		input [3:0]n,
		output reg  [31:0]result
		
);
//阶乘函数
function [31:0] factorial; //函数定义
	input [3:0] operand;
	reg [3:0] index;
	begin 
		factorial = operand ? 1 : 0;
		for(index = 2; index <= operand; index = index +1)begin 
			factorial = index * factorial;
		end
 
	end 
endfunction

always@(posedge clk) begin
	if(!rst_n)
		result <= 0;
	else
		result <= n*factorial(n)/((n*2)+1);
		
end



endmodule