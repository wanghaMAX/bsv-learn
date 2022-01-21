module sim;
	reg clk;
	reg rst;
	reg [31:0] count;

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		count = 1'b0;
	end

	always #1 clk = !clk;
	always #1 count = 1 + count;
	always #2 begin
		if (count >= 30)
			rst = 1'b1;
		//	$finish();
	end

	commonTb t(clk, rst);
endmodule
