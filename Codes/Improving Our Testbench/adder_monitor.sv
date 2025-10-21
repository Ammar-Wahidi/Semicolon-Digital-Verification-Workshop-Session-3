package adder_monitor_pkg;
  import adder_sequence_item_pkg::*;   // For sequence item definition
  import adder_scoreboard::*;          // For checking DUT results
  import adder_coverage_pkg::*;        // For collecting coverage

  class adder_monitor_class;
    adder_scoreboard_class monitor_scoreboard_object = new(); // Scoreboard instance
    adder_coverage cvr = new();                               // Coverage instance

    // Monitor task: called from testbench each cycle
    task monitor(adder_sequence_item_class value_extraction_object);
      monitor_scoreboard_object.scoreboard(value_extraction_object); // Send to scoreboard for checking
      cvr.sample_data(value_extraction_object);                      // Sample data for coverage
    endtask
  endclass
endpackage
