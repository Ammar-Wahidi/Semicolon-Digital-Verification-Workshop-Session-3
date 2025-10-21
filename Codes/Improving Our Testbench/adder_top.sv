module adder_top ();
bit clk ;
always #1 clk = ~clk ;
adder_if iff (clk);
adder dut (iff);
adder_tb tb (iff);
endmodule : adder_top // TOP