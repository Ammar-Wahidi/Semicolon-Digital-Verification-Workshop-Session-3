
module top();

bit [3:0] my_array[];
initial begin
my_array = new[5] ;
my_array = '{2, 3, 5, 7, 11};
$display("Sum: %0d", my_array.sum());//12
$display("Sum: %0d", (my_array.sum() with(int '(item)) ));//28
$display("Product: %0d", my_array.product());//6
$display("Product: %0d", (my_array.product() with(int '(item)) ));//2310
$display("Bitwise OR: %b", my_array.or());//1111
$display("Bitwise XOR: %b", my_array.xor());//1000
$display("Bitwise AND: %b", my_array.and());//0000
end

endmodule
