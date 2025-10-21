
module Br_cv();

always @(posedge clk or posedge reset)  
begin
if (reset)
C <= 5'b0;     // --> A    
else
C <= A + B;    // --> B
end

always @(*)
begin 
y = 5 ;                         
if (load)          
begin
    x = 5'b0;      // --> A  
end
else if (en)       
begin
    x = A + B;     // --> B  
end
    
    x = x + y ;    // --> C
end

endmodule

