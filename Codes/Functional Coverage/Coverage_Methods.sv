module func_coverage;
  bit [7:0] addr, data;

  covergroup c_group;                 // Define a covergroup (manual sampling)
    cp1: coverpoint addr;             // Coverpoint for 'addr'
    cp2: coverpoint data;             // Coverpoint for 'data'
    cp1_X_cp2: cross cp1, cp2;        // Cross coverage between addr and data
  endgroup : c_group

  c_group cg = new();                 // Create covergroup instance

  // Sampling process
  initial begin
    cg.start();                       // Start collecting coverage
    cg.set_inst_name("my_cg");        // Give covergroup a name for reports
    forever begin
      cg.sample();                    // Manually sample coverage each loop
      #5;
    end
  end

  // Stimulus process
  initial begin
    $monitor("At time = %0t: addr = %0d, data = %0d", $time, addr, data);
    repeat(5) begin
      addr = $random;                 // Randomize addr
      data = $random;                 // Randomize data
      #5;
    end
    cg.stop();                        // Stop collecting coverage
    $display("Coverage = %f", cg.get_coverage()); // Print total coverage %
    $finish;
  end
endmodule


 /*
  At time = 0: addr = 36, data = 129
 At time = 5: addr = 9, data = 99
 At time = 10: addr = 13, data = 141
 At time = 15: addr = 101, data = 18
 At time = 20: addr = 1, data = 13
 Coverage = 5.777995
 */
