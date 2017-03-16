# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {s_box.sv s_box_flex.sv operationG.sv gen_sub.sv gen_key.sv}
elaborate gen_key -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/gen_key.rep
report_area >> reports/gen_key.rep
report_power -hier >> reports/gen_key.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/gen_key.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit