package ruletest;

(* synthesize *)
module ruleTb();
	Reg#(int) x <- mkReg(23);

	rule countup (x < 30);
		int y = x + 1;
	 	x <= x + 1;
	 	$display("x = %0d, y = %0d", x, y);
	endrule

	rule done (x >= 30);
		$finish(0);
	endrule

endmodule: ruleTb

endpackage: ruletest
