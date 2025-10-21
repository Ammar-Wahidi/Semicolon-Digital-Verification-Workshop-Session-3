module top ();
intf intf1 ();
dut DUT (intf1.a,intf1.b) ;
tb TB (intf1.a,intf1.b) ;
endmodule

interface intf;
wire [3:0] a ;
wire [3:0] b ;
// a and b here are inout direction (as default)
endinterface

module dut(
input logic [3:0] a_dut ,
output logic [3:0] b_dut 
)
endmodule

module tb (
input  logic [3:0] b_tb ,
output logic [3:0] a_tb 
);
endmodule