//`include "./define_function.v"
`timescale 1ns/100ps
`define clk_cycle 50
module define_function_tst();

reg clk_tst;
reg rst_n_tst;
reg [3:0]n_tst;
reg [3:0]i_tst;
wire[31:0] result_tst;



always #`clk_cycle clk_tst = ~clk_tst;

initial begin
	$display("Running testbench"); 
	n_tst = 4'd0;
	clk_tst = 0;
	rst_n_tst = 1;
	i_tst = 4'd1;
	
	#10
	rst_n_tst = 0;
	#10
	rst_n_tst = 1;
	for(i_tst=0; i_tst<=15; i_tst=i_tst+1) begin
		#200 n_tst = i_tst;
	end
	#100 
	 n_tst={$random}%16; //give a radom number blongs to [0,15]
	#100
		$stop;
end 


define_function il_sim(
	.clk(clk_tst),
	.rst_n(rst_n_tst),
	.n(n_tst),
	.result(result_tst)
);

endmodule