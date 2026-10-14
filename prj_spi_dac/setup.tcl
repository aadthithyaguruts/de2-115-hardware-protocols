load_package flow
project_new prj_spi_dac -overwrite
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE115F29C7
set_global_assignment -name TOP_LEVEL_ENTITY spi_dac_tx
set_global_assignment -name VERILOG_FILE rtl/spi_dac_tx.v
set_location_assignment PIN_Y2   -to clk_50mhz
set_location_assignment PIN_M23  -to rst_n
set_location_assignment PIN_AE13 -to sclk
set_location_assignment PIN_AD14 -to mosi
set_location_assignment PIN_AC14 -to cs_n
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to *
export_assignments
execute_flow -compile
project_close
