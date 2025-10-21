
module cg_slides();

covergroup cov_grp;               // Define a covergroup (no event specified → user must call .sample() manually)
    cov_p1: coverpoint a;         // Define a coverpoint on signal 'a' — measures its value coverage
endgroup

cov_grp cov_inst = new();         // Create an instance of the covergroup

@(abc) cov_inst.sample();         // Wait for event 'abc' to occur, then call .sample() manually to record coverage

///////////////////////////////////////////////////////////////////////////////////////////////

// Covergroup with arguments
covergroup cov_grp @(posedge clk); // Define a covergroup that automatically samples on every posedge of clk
    cov_p1: coverpoint a;          // Coverpoint on 'a' — sampled automatically on each posedge clk
endgroup

cov_grp cov_inst = new();          // Create an instance; no need to call .sample() manually (instance and handle)


covergroup cg (ref int var, input bit mode);
    coverpoint var;
endgroup

cg mycg = new(my_var, 1'b0); // pass arguments in module
/*
Data types are integral only.
• Ref → samples live variable values (different instances can track different variables).
• Input → snapshot at creation (does not track updates) and not used. (default direction)
• Output/Inout → not allowed
• Arguments are read-only inside the covergroup.
*/

///////////////////////////////////////////////////////////////////////////////////////////////


endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
// Covergroup inside a class
bit clk ;

class xyz;
bit [3:0] m_x;
bit [3:0] m_y;

// embedded covergroup, Type == instance 
covergroup cov1 @(posedge clk); // covergroup samples at posedge clk
    coverpoint m_x;               // coverpoint for m_x
    coverpoint m_y;               // coverpoint for m_y
endgroup 

function new(); 
    cov1 = new;                   // create covergroup instance
endfunction
endclass 

module top();
xyz c_xyz;                      // class handle, and Covergroup handle in the same time

initial clk = 0;
always #5 clk = ~clk;           // clock generation

always @(posedge clk) c_xyz.m_x++; // increment m_x each clock
always @(posedge clk) c_xyz.m_y++; // increment m_y each clock

initial begin
    #12;
    c_xyz = new();                // create class object (and its covergroup)
end
endmodule
