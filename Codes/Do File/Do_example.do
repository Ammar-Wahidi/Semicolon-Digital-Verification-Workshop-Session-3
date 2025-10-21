# ============================================================
# Title      : Do_example.do
# Purpose    : Automate compilation, simulation, and coverage 
#              report generation in QuestaSim
# Workshop   : Semicolon Digital Verification Workshop - Session 3
# ============================================================

# ============================================================
# Create and map the working library
# ============================================================
vlib work

# ============================================================
# Compile all required design and testbench files
#    +cover enables code and functional coverage collection
# ============================================================
vlog ALSU_pkg.sv ALSU.v ALSU_tb.sv +cover

# ============================================================
# Start simulation
#    -voptargs=+acc enables full signal access for debugging
#    -cover enables coverage data collection
# ============================================================
vsim -voptargs=+acc work.ALSU_tb -cover

# ============================================================
# Add all signals from the testbench to the waveform window
#    (Optional — helps for visual waveform inspection)
# ============================================================
add wave *

# ============================================================
# Specify coverage database output
#    The coverage will be automatically saved to ALSU_test.ucdb 
#    when the simulation finishes.
# ============================================================
coverage save ALSU_test.ucdb -onexit

# ============================================================
# Run the simulation until completion
# ============================================================
run -all

# ============================================================
# Generate detailed coverage report
#    -details  : provides per-bin information
#    -all      : includes all coverage types (code + functional)
#    -annotate : annotates uncovered code
#    -output   : writes report to a text file (ALSU_cvr.txt)
# ============================================================
vcover report ALSU_test.ucdb -details -all -annotate -output ALSU_cvr.txt

# ============================================================
# End simulation session
# ============================================================
quit -sim

# ============================================================
# End of Do_example.do
# ============================================================
