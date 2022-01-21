package regpipeline;

module regpipelineTb();
	Reg#(int) x <- mkReg('h10);
	Pipe_ifc  pipe <- mkPipe;

	rule fill;
		pipe.send(x);
		x <= x + 'h10;
	endrule

	rule drain;
		let y = pipe.recv();
		$display("y = %0h", y);
		if (y > 'h80) $finish();
	endrule

endmodule: regpipelineTb

interface Pipe_ifc;
	method Action send(int a);
	method int recv();
endinterface

(* synthesize *)
module mkPipe(Pipe_ifc);
	Reg#(int) x1 <- mkRegU;
	Reg#(int) x2 <- mkRegU;
	Reg#(int) x3 <- mkRegU;
	Reg#(int) x4 <- mkRegU;

	rule r1;
		x2 <= x1 + 1;
		x3 <= x2 + 1;
		x4 <= x3 + 1;
	endrule

	rule show;
		$display("x1, x2, x3, x4 = %0h, %0h, %0h, %0h", x1, x2, x3, x4);
	endrule

	method Action send(int a);
		x1 <= a;
	endmethod

	method int recv();
		return x4;
	endmethod

endmodule: mkPipe

endpackage
