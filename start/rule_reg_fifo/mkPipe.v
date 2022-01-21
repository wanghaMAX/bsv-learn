//
// Generated by Bluespec Compiler, version 2021.07-10-gb37e90ec (build b37e90ec)
//
// On Thu Nov 11 15:44:11 CST 2021
//
//
// Ports:
// Name                         I/O  size props
// RDY__write                     O     1 const
// _read                          O    32 reg
// RDY__read                      O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// _write_1                       I    32 reg
// EN__write                      I     1
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

module mkPipe(CLK,
	      RST_N,

	      _write_1,
	      EN__write,
	      RDY__write,

	      _read,
	      RDY__read);
  input  CLK;
  input  RST_N;

  // action method _write
  input  [31 : 0] _write_1;
  input  EN__write;
  output RDY__write;

  // value method _read
  output [31 : 0] _read;
  output RDY__read;

  // signals for module outputs
  wire [31 : 0] _read;
  wire RDY__read, RDY__write;

  // register valid1
  reg valid1;
  wire valid1$D_IN, valid1$EN;

  // register valid2
  reg valid2;
  wire valid2$D_IN, valid2$EN;

  // register valid3
  reg valid3;
  wire valid3$D_IN, valid3$EN;

  // register valid4
  reg valid4;
  wire valid4$D_IN, valid4$EN;

  // register x1
  reg [31 : 0] x1;
  wire [31 : 0] x1$D_IN;
  wire x1$EN;

  // register x2
  reg [31 : 0] x2;
  wire [31 : 0] x2$D_IN;
  wire x2$EN;

  // register x3
  reg [31 : 0] x3;
  wire [31 : 0] x3$D_IN;
  wire x3$EN;

  // register x4
  reg [31 : 0] x4;
  wire [31 : 0] x4$D_IN;
  wire x4$EN;

  // action method _write
  assign RDY__write = 1'd1 ;

  // value method _read
  assign _read = x4 ;
  assign RDY__read = valid4 ;

  // register valid1
  assign valid1$D_IN = 1'd1 ;
  assign valid1$EN = EN__write ;

  // register valid2
  assign valid2$D_IN = valid1 ;
  assign valid2$EN = 1'd1 ;

  // register valid3
  assign valid3$D_IN = valid2 ;
  assign valid3$EN = 1'd1 ;

  // register valid4
  assign valid4$D_IN = valid3 ;
  assign valid4$EN = 1'd1 ;

  // register x1
  assign x1$D_IN = _write_1 ;
  assign x1$EN = EN__write ;

  // register x2
  assign x2$D_IN = x1 + 32'd1 ;
  assign x2$EN = 1'd1 ;

  // register x3
  assign x3$D_IN = x2 + 32'd1 ;
  assign x3$EN = 1'd1 ;

  // register x4
  assign x4$D_IN = x3 + 32'd1 ;
  assign x4$EN = 1'd1 ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        valid1 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	valid2 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	valid3 <= `BSV_ASSIGNMENT_DELAY 1'd0;
	valid4 <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (valid1$EN) valid1 <= `BSV_ASSIGNMENT_DELAY valid1$D_IN;
	if (valid2$EN) valid2 <= `BSV_ASSIGNMENT_DELAY valid2$D_IN;
	if (valid3$EN) valid3 <= `BSV_ASSIGNMENT_DELAY valid3$D_IN;
	if (valid4$EN) valid4 <= `BSV_ASSIGNMENT_DELAY valid4$D_IN;
      end
    if (x1$EN) x1 <= `BSV_ASSIGNMENT_DELAY x1$D_IN;
    if (x2$EN) x2 <= `BSV_ASSIGNMENT_DELAY x2$D_IN;
    if (x3$EN) x3 <= `BSV_ASSIGNMENT_DELAY x3$D_IN;
    if (x4$EN) x4 <= `BSV_ASSIGNMENT_DELAY x4$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    valid1 = 1'h0;
    valid2 = 1'h0;
    valid3 = 1'h0;
    valid4 = 1'h0;
    x1 = 32'hAAAAAAAA;
    x2 = 32'hAAAAAAAA;
    x3 = 32'hAAAAAAAA;
    x4 = 32'hAAAAAAAA;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE) if (valid1) $write("%0h ", $signed(x1));
    if (RST_N != `BSV_RESET_VALUE) if (!valid1) $write("Invalid ");
    if (RST_N != `BSV_RESET_VALUE) if (valid2) $write("%0h ", $signed(x2));
    if (RST_N != `BSV_RESET_VALUE) if (!valid2) $write("Invalid ");
    if (RST_N != `BSV_RESET_VALUE) if (valid3) $write("%0h ", $signed(x3));
    if (RST_N != `BSV_RESET_VALUE) if (!valid3) $write("Invalid ");
    if (RST_N != `BSV_RESET_VALUE) if (valid4) $write("%0h ", $signed(x4));
    if (RST_N != `BSV_RESET_VALUE) if (!valid4) $write("Invalid ");
    if (RST_N != `BSV_RESET_VALUE) $display("");
  end
  // synopsys translate_on
endmodule  // mkPipe
