package Adder;

interface Ifc_t;
	method int sum(int x, int y, int z);
endinterface: Ifc_t

(* synthesize *)
module mkIfcIns (Ifc_t);
	method int sum(int x, int y, int z);
		return x+y+z;
	endmethod
endmodule: mkIfcIns

endpackage: Adder
