load_package flow
project_new prj_uart_parser -overwrite
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY uart_register_ctrl
set_global_assignment -name VERILOG_FILE rtl/uart_register_ctrl.v
set_location_assignment PIN_Y2  -to clk_50mhz
set_location_assignment PIN_M23 -to rst_n
set_location_assignment PIN_G12 -to rx_byte[0]
set_location_assignment PIN_G13 -to rx_byte[1]
set_location_assignment PIN_G14 -to rx_byte[2]
set_location_assignment PIN_G15 -to rx_byte[3]
set_location_assignment PIN_F12 -to rx_byte[4]
set_location_assignment PIN_AB22 -to rx_byte[5]
set_location_assignment PIN_F14 -to rx_byte[6]
set_location_assignment PIN_F15 -to rx_byte[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *
export_assignments
execute_flow -compile
project_close
