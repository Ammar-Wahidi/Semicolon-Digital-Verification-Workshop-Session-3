
module cross_coverage ();

covergroup cg;                            // Define a covergroup (manual sampling)
  
  cp_in : coverpoint seq_item.in;         // Coverpoint to track values of 'seq_item.in'
  
  cp_direction : coverpoint seq_item.direction; // Coverpoint to track values of 'seq_item.direction'
  
  cross cp_in, cp_direction;              // Cross coverage — checks all combinations of in & direction
  
endgroup

///////////////////////////////////////////////////////////////////////////////
// Exclude bins (With, bins of and intersect)
covergroup cg @(posedge clk);
coverpoint opcode {
    bins add = {ADD};
    bins sub = {SUB};
    bins mul = {MUL};
    bins div = {DIV};}
coverpoint operand {
    bins max = {127};
    bins min = {-128};
    bins zero = {0};
    bins other = default;}
cross opcode, operand {
    ignore_bins div_by_zero = binsof(opcode.div) && binsof(operand.zero); 
    ignore_bins div_by_zero = binsof(opcode) intersect {DIV} && binsof(operand) intersect {0}; }
endgroup


bit [2:0] a,b,c ;
covergroup cov @(posedge clk);
coverpoint a {
    bins bin_1 = {1,2,3};
    bins bin_2 = {4,5,6,7};}
coverpoint b {
    bins bin_3 = {1,2,3};
    bins bin_4 = {4,5,6,7};}
c_w:coverpoint c {
    bins bin_w[] = c_w with (item >2);} // {3,4,5,6,7}
cross a,b {
    bins bin_5 = binsof(a.bin_2);
    bins bin_6 = binsof(a.bin_1 || b.bin_3); 
    bins bin_7 = binsof(a.bin_1 && b.bin_3); } 
endgroup

/*
What will be bins_5 ?? bin_2 & bin_3
Bin_2 & bin_4
Only one bin with 12+16 possibilities if one hit, bin hit

Bin_6 is union || so it will be a.bin_1 with every bins in b and also b.bin_2 with every bins in a
// 3 cross product bin_1&bin_3 ,bin_1&bin_4 , xxbin_3&bin_1xx , bin_3&bin_2
Again one hit, bin hit 

Bin_7 is intersection (A ∩ B) &&  
// 1 cross product bin_1&bin_3


If bin6 was bins bin_6 = binsof(a.bin_1 || a.bin_2);
Union will be 4 cross product  bin_1&bin_3 ,bin_1&bin_4 , bin_2&bin_3 , bin_2&bin_4
Again one hit, bin hit 
Cause this not array , if array then each one in bin


In the last ask about number of bins in cross ? 3+4 =7 bins

*/

endmodule
