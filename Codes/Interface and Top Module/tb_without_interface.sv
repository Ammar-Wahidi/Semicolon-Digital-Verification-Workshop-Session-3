module top ();
logic [3:0] a , b ;
dut DUT (a,b) ;
tb TB (a,b) ;
endmodule

module tb (
input  logic [3:0] b_tb ,
output logic [3:0] a_tb 
);
endmodule

module dut (
input  logic [3:0] a_dut ,
output logic [3:0] b_dut
);
endmodule


