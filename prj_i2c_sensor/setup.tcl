load_package flow
project_new prj_i2c_sensor -overwrite
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY i2c_temp_reader
set_global_assignment -name VERILOG_FILE rtl/i2c_temp_reader.v
set_location_assignment PIN_Y2  -to clk_100khz
set_location_assignment PIN_M23 -to rst_n
set_location_assignment PIN_B7  -to scl
set_location_assignment PIN_A8  -to sda
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *
set_instance_assignment -name CURRENT_STRENGTH_NEW "MINIMUM CURRENT" -to scl
set_instance_assignment -name CURRENT_STRENGTH_NEW "MINIMUM CURRENT" -to sda
export_assignments
execute_flow -compile
project_close
