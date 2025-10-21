 module adder (adder_if.DUT Iff);
 always @(posedge Iff.clk) begin
 Iff.c = Iff.a + Iff.b;
 end
 endmodule : adder // DUT