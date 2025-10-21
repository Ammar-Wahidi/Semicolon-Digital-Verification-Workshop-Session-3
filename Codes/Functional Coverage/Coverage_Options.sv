
module options();

cross opcode, operand {                         // Define cross coverage between opcode and operand
  
  bins op = binsof(opcode.add) &&               // Bin only when opcode == 'add'
             (binsof(operand.max) ||            // ...and operand == 'max'
              binsof(operand.min));              // or operand == 'min'
  
  option.weight = 5;                            // Each hit counts as 5 hits (higher importance)
  
  option.cross_auto_bin_max = 0;                // Disable automatic cross bins (only user-defined bins)
}

endmodule
