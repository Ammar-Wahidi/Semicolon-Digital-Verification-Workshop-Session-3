module sc_se();
logic [7:0] a, b, c; 
initial begin 
    a = 2;
    #2 c = 10;
    #4 b = 8;
end
initial begin
    a = 5; c = 6; b = 1;
    #2 c <= 8;
    #3;
    b <= 4;
    a = b;
    #1;
    #0 b = 15;
end
endmodule

/* Output
# T=0 :
a=5
c=6
b=1
# T=2 :
c=8 (NBA)
# T=5 :
a=1
b=4 (NBA)
# T=6 :
b=15 (inactive)
*/