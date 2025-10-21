module top();
int my_array[5];

initial
begin
my_array = '{20, 10, 30, 50, 40};
my_array.sort();
$display("Array after sort():%p",my_array);//'{10, 20, 30, 40, 50}
my_array.reverse();
$display("\nArray after reverse() :%p",my_array);//'{50, 40, 30, 20, 10}
my_array.shuffle();
$display("\nArray after shuffle():%p",my_array);//'{10, 40, 50, 30, 20}
my_array.rsort();
$display("\nArray after rsort():%p",my_array);//'{50, 40, 30, 20, 10}
end
endmodule
