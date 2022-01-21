package common;

module commonTb();
	Reg#(int)       step   <- mkReg(0);
	Reg#(Int#(16))  int16  <- mkReg('h800);
	Reg#(UInt#(16)) uint16 <- mkReg('h800);

	rule init (step == 1);
		$display("Zero");
		step <= step + 1;
		if (step == 5)
		begin
			$display("Here");
			$finish();
		end
	endrule

	rule step0 (step == 0);
		$display("== step 0 ==");

		UInt#(16) foo = 'h1fff;
		$display("foo = %x", foo);

		foo = foo & 5;
		$display("foo = %x", foo);
		// $display("foo = %x", foo[0]);

		foo = 'hffff;
		$display("foo = %x", foo);

		foo = foo + 1;
		$display("foo = %x", foo);
		$display("fooneg = %x", foo < 0);

		UInt#(16) maxUInt16 = unpack('1);
		UInt#(16) minUInt16 = unpack(0);

		$display("maxUInt16 = %x", maxUInt16);
		$display("minUInt16 = %x", minUInt16);

		$display("%x < %x = %x", minUInt16, maxUInt16, minUInt16 < maxUInt16);
		step <= step + 1;
	endrule

	rule step1 (step == 1);
		$display("== step 1 ==");

		Int#(16) maxInt16 = unpack({1'b0, '1}); // 'b0111111
		Int#(16) minInt16 = unpack({1'b0, '0}); // 'b1000000

		$display("maxInt16 %x minInt16 %x.", maxInt16, minInt16);

		$display("maxInt16/4 = %x", maxInt16/4);

		int16 <= int16 / 4;
		step <= step + 1;
	endrule

	rule step2 (step == 2);
		$display("== step 2 ==");
		Int#(32) bar = 10;
		int foo = bar;
		$display("foo is 32 bits %b", foo);

		bit onebit = 1;
		Bit#(1) anotherbit = onebit;

		$display("this is 1 bit = %b", onebit);

		step <= step + 1;
	endrule

	rule step3 (step == 3);
		$display("== step 3 ==");

		Bool b1 = True;
		Bool b2 = True;
		Bool b3 = b1 && b2;

		if (b1)
			$display("b1 is True");

		bit onebit = 1;

	//	if (onebit)
	//		$display("one bit is 1");

		step <= step + 1;
	endrule

	rule step4 (step == 4);
		$display("== step 4 ==");
		$display("== All done ==");

		$finish(0);
	endrule

endmodule: commonTb

endpackage: common
