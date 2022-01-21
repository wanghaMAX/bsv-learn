package composition;

(* synthesize *)
module compositionTb();
	Reg#(int) x1 <- mkReg(10);
	Reg#(int) y1 <- mkReg(100);

	Reg#(int) x2 <- mkReg(10);
	Reg#(int) y2 <- mkReg(100);

	rule r1;
		$display("r1");
		x1 <= y1 + 1;
		y1 <= x1 + 1;
	endrule

	rule r2a;
		$display("r2a");
		x2 <= y2 + 1;
	endrule

	rule r2b;
		$display("r2b");
		y2 <= x2 + 1;
	endrule

	(* descending_urgency = "r2a, r2b" *)

	rule show;
		$display("x1,y1 = %0d,%0d; x2,y2 = %0d,%0d;", x1, y1, x2, y2);
		if (x1 >= 105) $finish();
	endrule

endmodule
	
endpackage
