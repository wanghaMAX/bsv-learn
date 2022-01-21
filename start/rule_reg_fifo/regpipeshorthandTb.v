//
// Generated by Bluespec Compiler, version 2021.07-10-gb37e90ec (build b37e90ec)
//
// On Thu Nov 11 15:30:58 CST 2021
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module regpipeshorthandTb(CLK,
			  RST_N);
  input  CLK;
  input  RST_N;

  // register x
  reg [31 : 0] x;
  wire [31 : 0] x$D_IN;
  wire x$EN;

  // ports of submodule pipe
  wire [31 : 0] pipe$_read, pipe$_write_1;
  wire pipe$EN__write;

  // submodule pipe
  mkPipe pipe(.CLK(CLK),
	      .RST_N(RST_N),
	      ._write_1(pipe$_write_1),
	      .EN__write(pipe$EN__write),
	      .RDY__write(),
	      ._read(pipe$_read),
	      .RDY__read());

  // register x
  assign x$D_IN = x + 32'h00000010 ;
  assign x$EN = 1'd1 ;

  // submodule pipe
  assign pipe$_write_1 = x ;
  assign pipe$EN__write = 1'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        x <= `BSV_ASSIGNMENT_DELAY 32'h00000010;
      end
    else
      begin
        if (x$EN) x <= `BSV_ASSIGNMENT_DELAY x$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    x = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    $display("y = %0h", $signed(pipe$_read));
    if ((pipe$_read ^ 32'h80000000) > 32'h80000080) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // regpipeshorthandTb

