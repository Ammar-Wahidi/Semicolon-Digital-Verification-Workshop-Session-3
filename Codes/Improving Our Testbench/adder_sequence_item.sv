
package adder_sequence_item_pkg;
class adder_sequence_item_class;
rand logic [3:0] a, b;
logic [4:0] c;
bit clk;
constraint constraint_1 {
    a dist {[0:14]:/70,15:/30};
    b dist {[0:14]:/70,15:/30};
}
endclass 
endpackage
