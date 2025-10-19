package alu_cov_pkg;

  class ALU_coverage;

    // sampled signals
    bit        serial_in_s;
    bit        direction_s;
    logic [3:0] opcode_s;
    logic [2:0] a_s, b_s;

    // single covergroup with all requirements
    covergroup cg ;
     
      // to try assignment step later
      // option.cross_auto_bin_max = 0;  

      // --- Serial_in ---
      cp_serial : coverpoint serial_in_s {
        bins zero = {0};
        bins one  = {1};
      }

      // --- Direction ---
      cp_dir : coverpoint direction_s {
        bins left  = {0};
        bins right = {1};
      }

      // --- Opcode bins (each operation) ---
      cp_op : coverpoint opcode_s {
        bins SUB   = {4'b0000};
        bins ADD   = {4'b0001};
        bins DIV   = {4'b0010};
        bins MUL   = {4'b0011};
        bins SHIFT = {4'b0100};
        bins ROT   = {4'b0101};
        bins NOTA  = {4'b0110};
        bins INCA  = {4'b0111};
        bins AND   = {4'b1000};
        bins NOTB  = {4'b1001};
        bins NAND  = {4'b1011};
        bins NOR   = {4'b1100};
        bins OR    = {4'b1101};
        bins XOR   = {4'b1110};
        bins XNOR  = {4'b1111};
      }

      // --- Operand A ---
      cp_a : coverpoint a_s {
        bins min_val      = {3'b000};
        bins max_val      = {3'b111};
        bins checkerboard = {3'b101};   // 5555 → 0x5 → "101" fits 3-bit
        bins others       = default;
      }

      // --- Operand B ---
      cp_b : coverpoint b_s {
        bins min_val      = {3'b000};
        bins max_val      = {3'b111};
        bins checkerboard = {3'b101};
        bins others       = default;
      }

      // --- Crosses ---
      cross_a_op : cross cp_a, cp_op {
        // Example except: ignore invalid division when a=0
        ignore_bins invalid = binsof(cp_op.DIV) && binsof(cp_a.min_val);
        ignore_bins Not_b = binsof(cp_op.NOTB) && binsof(cp_a);
      }

      cross_b_op : cross cp_b, cp_op {
        // Example except: ignore division by zero
        ignore_bins div0 = binsof(cp_op.DIV) && binsof(cp_b.min_val);
        ignore_bins shift_a = binsof(cp_op.SHIFT) && binsof(cp_b);
        ignore_bins rot_a = binsof(cp_op.ROT)&&binsof(cp_b) ;
      }

      cross_s_d : cross cp_serial, cp_dir;

      cross_s_op : cross cp_serial, cp_op {
        bins s_op = binsof(cp_serial) && binsof(cp_op.SHIFT);
        option.cross_auto_bin_max = 0 ;
      }
       cross_d_op : cross cp_dir, cp_op {
         bins b1 = binsof(cp_dir.right) && binsof(cp_op.SHIFT);
         bins b2 = binsof(cp_dir.left) && binsof(cp_op.SHIFT);
         bins b3 = binsof(cp_dir) && binsof(cp_op.ROT);
         option.cross_auto_bin_max = 0 ;
      }

    endgroup : cg



    function new();
      cg = new();
    endfunction

    // sample function
    function void sample_cvg(bit serial_in_i, bit direction_i,
                             logic [3:0] opcode_i,
                             logic [2:0] a_i,
                             logic [2:0] b_i);
      serial_in_s = serial_in_i;
      direction_s = direction_i;
      opcode_s    = opcode_i;
      a_s         = a_i;
      b_s         = b_i;
      cg.sample();
    endfunction

  endclass : ALU_coverage

endpackage : alu_cov_pkg