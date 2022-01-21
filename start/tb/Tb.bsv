package Tb;

(* synthesize *)
module mkTb (Empty);
	rule greet;
	$display("Hello world");
	$finish (0);
	endrule
endmodule: mkTb

endpackage: Tb

