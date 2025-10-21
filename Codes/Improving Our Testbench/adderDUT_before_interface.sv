
module adder (a, b, c ,clk);
input [3:0] a, b ;
input clk;
output reg [4:0] c;
always @(posedge clk) begin
    c = a + b;
end
endmodule