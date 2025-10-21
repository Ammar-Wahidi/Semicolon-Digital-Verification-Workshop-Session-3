import adder_sequence_item_pkg::*;     // Import sequence item class
import adder_monitor_pkg::*;           // Import monitor class

module adder_tb();
  logic [3:0] a, b;
  logic [4:0] c;
  bit clk;

  adder_sequence_item_class adder_tb_sequence_item_object = new(); // Stimulus object
  adder_monitor_class adder_tb_monitor_object = new();             // Monitor object

  adder DUT (a, b, c, clk);              // Instantiate DUT

  // Clock generation
  initial begin
    clk = 0;
    forever #20 clk = ~clk;
  end

  // Test process
  initial begin
    for (int i = 0; i < 100; i++) begin
      assert (adder_tb_sequence_item_object.randomize()); // Randomize inputs
      a = adder_tb_sequence_item_object.a;
      b = adder_tb_sequence_item_object.b;
      @(negedge clk);
      adder_tb_sequence_item_object.c = c;                 // Capture DUT output
      adder_tb_monitor_object.monitor(adder_tb_sequence_item_object); // Send to monitor
    end
    @(negedge clk);
    $stop;
  end
endmodule
