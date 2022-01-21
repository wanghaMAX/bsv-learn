package variable;

import FIFO::*;
import GetPut::*;
import ClientServer::*;

typedef struct {
	int x;
	int y;
} Coord deriving (Bits);

module mkTransformer(Server#(Coord, Coord));
	FIFO#(Coord) fi <- mkFIFO;
	FIFO#(Coord) fo <- mkFIFO;

	Coord delta1 = Coord {
		x: 10,
		y: 20
	};
	let delta2 = Coord {
		x: 5,
		y: 8
	};

	rule transform;
		Coord c = fi.first();
		fi.deq();
		c.x = c.x + delta1.x + delta2.x;
		c.y = c.y + delta1.y + delta2.y;
		fo.enq(c);
	endrule

	interface request = toPut(fi);
	interface response = toGet(fo);
endmodule: mkTransformer

(* synthesize *)
module varTb();
	Reg#(int) cycle <- mkReg(0);

	Reg#(int) rx <- mkReg(0);
	Reg#(int) ry <- mkReg(0);

	Server#(Coord, Coord) s <- mkTransformer;

	rule count_cycles;
		cycle <= cycle + 1;
		if (cycle > 7)
			$finish();
	endrule

	rule source;
		let c = Coord {
			x: rx,
			y: ry
		};
		s.request.put (c);
		rx <= rx + 1;
		ry <= ry + 1;
		$display("%0d, rule source, sending Coord { x: %0d, y: %0d }", cycle, rx, ry);
	endrule

	rule sink;
		let c <- s.response.get();
		$display("%0d, rule sink, recving Coord { x: %0d, y: %0d }", cycle, c.x, c.y);
	endrule

endmodule: varTb

endpackage: variable

