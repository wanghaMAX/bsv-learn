package circuits;

import FIFO::*;
import GetPut::*;
import ClientServer::*;

(* synthesize *)
module circuitsTb();
	Reg#(int) cycle <- mkReg(0);
	rule count_cycle;
		cycle <= cycle + 1;
		if (cycle > 7)
			$finish();
	endrule

	int x = 10;

	rule r;
		int a = x;
		a = a * a;
		a = a - 5;

		if (pack(cycle)[0] == 0)
			a = a + 1;
		else
			a = a + 2;

		if (pack(cycle)[1:0] == 3)
			a = a + 3;

		for (int k = 20; k < 27; k = k + 1)
			a = a + 1;

		$display("%0d, rule r, a = %0d", cycle, a);
	endrule

endmodule: circuitsTb

endpackage: circuits
