module top();
int a_array [string]; // key is a string
int a_wild [*]; // Wild Card(any index type can take place, it can change)
string s;

initial
begin
a_array["alpha"] = 10;
a_array["beta"] = 20;
a_array["gamma"] = 30;
// Here we assign using a string key to a_wild, so it becomes an associative array with string keys
a_wild [“string_wild"] = 100 ; // It is now in type string 

if (a_array.exists("beta")) 
    $display("Key 'beta' exists with value: %0d", a_array["beta"]); // 20

$display("Number of elements in a_array: %0d", a_array.num()); // 3

if (a_array.first(s)) 
    $display("First key: %s, Value: %0d", s, a_array[s]);//alpha 10
if (a_array.last(s)) 
    $display("Last key: %s, Value: %0d", s, a_array[s]);//gamma 30

s="beta";
if (a_array.next(s))
    $display("next key: %s, Value: %0d", s, a_array[s]);//gamma 30
if (a_array.prev(s))
    $display("prev key: %s, Value: %0d", s, a_array[s]);//beta 20
    
a_array.delete("beta");
a_array.delete();
end
endmodule