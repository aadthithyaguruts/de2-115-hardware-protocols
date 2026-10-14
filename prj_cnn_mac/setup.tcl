load_package flow
project_new prj_cnn_mac -overwrite
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY fc_mac_element
set_global_assignment -name VERILOG_FILE rtl/fc_mac_element.v
set_location_assignment PIN_Y2  -to clk
set_location_assignment PIN_M23 -to rst_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *
export_assignments
execute_flow -compile
project_close
