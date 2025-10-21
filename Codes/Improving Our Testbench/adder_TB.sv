import adder_sequence_item_pkg::*;     // Import sequence item class
import adder_monitor_pkg::*;           // Import monitor class

module adder_tb(adder_if.TEST Iff);    // Testbench connected to interface (TEST modport)

  // Instantiate DUT using same interface (DUT modport)
  adder DUT (Iff);

  adder_sequence_item_class adder_tb_sequence_item_object = new(); // Stimulus object
  adder_monitor_class adder_tb_monitor_object = new();             // Monitor object

  // Test process
  initial begin
    for (int i = 0; i < 1000; i++) begin
      assert (adder_tb_sequence_item_object.randomize()); // Randomize inputs
      Iff.a = adder_tb_sequence_item_object.a;
      Iff.b = adder_tb_sequence_item_object.b;
      @(negedge Iff.clk);
      adder_tb_sequence_item_object.c = Iff.c;            // Capture DUT output
      adder_tb_monitor_object.monitor(adder_tb_sequence_item_object); // Send to monitor
    end
    @(negedge Iff.clk);
    $stop;
  end
endmodule : adder_tb  // TB

// DUT module — performs addition
module adder (adder_if.DUT Iff);
  always @(posedge Iff.clk) begin
    Iff.c = Iff.a + Iff.b;             // Simple combinational addition on clock edge
  end
endmodule : adder_tb
