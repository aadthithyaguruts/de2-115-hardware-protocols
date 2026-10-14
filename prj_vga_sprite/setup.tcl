load_package flow
project_new prj_vga_sprite -overwrite
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY vga_sprite_physics
set_global_assignment -name VERILOG_FILE rtl/vga_sprite_physics.v
set_location_assignment PIN_C13 -to vsync
set_location_assignment PIN_M23 -to rst_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *
export_assignments
execute_flow -compile
project_close
