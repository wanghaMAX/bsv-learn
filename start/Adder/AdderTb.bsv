package AdderTb;

import Adder::*;

(* synthesize *)
module adderTb (Empty);
	Ifc_t ifc <- mkIfcIns;
	rule aaa;
		$display ("Answer is %d", ifc.sum(2, 3, 4));
		$finish (0);
	endrule
endmodule: adderTb

endpackage: AdderTb

