module st_cv();

always @(posedge clk or posedge reset) // --> 1 
begin
if (reset)          // --> 2
    C <= 5'b0;      // --> 3
else
    C <= A + B;     // --> 4
end

endmodule