
module top();

// Declaration
bit [7:0] d_array1[ ];
int d_array2[ ];
initial 
begin
// Memory allocation
d_array1 = new[4]; 
d_array2 = new[6];
// Array initialization
d_array1 = {0,1,2,3};
foreach(d_array2[j]) d_array2[j] = j;

// Change the length of the array after declaration
d_array1 = new[10];
// Allocate 6 new elements and retain values of 4 elements.
d_array1 = new[10](d_array1);
// Size of array (reduction method)
$display("Size of d_array1 %0d",d_array1.size());
// Delete array
d_array1. delete();
end

endmodule
