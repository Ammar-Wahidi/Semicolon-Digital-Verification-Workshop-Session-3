package adder_coverage_pkg;
  import adder_sequence_item_pkg::*;   // Import sequence item definition

  class adder_coverage;
    adder_sequence_item_class seq_item = new(); // Object to hold transaction data

    // Define covergroup for functional coverage
    covergroup cg;
      // Coverpoint for input 'a'
      cp_a : coverpoint seq_item.a {
        bins max  = {15};              // when a = 15
        bins zero = {0};               // when a = 0
        bins other = default;          // all other values
      }

      // Coverpoint for input 'b'
      cp_b : coverpoint seq_item.b;

      // Coverpoint for output 'c'
      cp_c : coverpoint seq_item.c {
        bins max  = {30};              // when c = 30
        bins min  = {0};               // when c = 0
        bins other = default;          // all other values
      }

      cross cp_a, cp_b;                // Cross coverage between a and b
    endgroup

    // Sample coverage data using transaction object
    function sample_data(adder_sequence_item_class item);
      seq_item = item;                 // Copy transaction fields
      cg.sample();                     // Record coverage sample
    endfunction

    // Constructor
    function new();
      cg = new();                      // Create covergroup instance
    endfunction
  endclass : adder_coverage
endpackage : adder_coverage_pkg
