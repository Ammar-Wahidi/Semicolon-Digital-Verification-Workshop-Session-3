module top ();
intf intf1 ();
dut DUT (intf1) ;
tb TB (intf1) ;
endmodule

interface intf;
wire [3:0] a ;
wire [3:0] b ;
modport dut (input a, output b);
modport test (input b, output a);
endinterface


module dut (intf.dut intf1);
logic [3:0] a_dut ;
logic [3:0] b_dut ;
assign a_dut = intf1.a ;
assign intf1.b = b_dut ;
endmodule

module tb (intf.test intf1);
logic [3:0] b_tb ;
logic [3:0] a_tb ;
assign b_tb = intf1.b ;
assign intf1.a = a_dut ;
endmodule
