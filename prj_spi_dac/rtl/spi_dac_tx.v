module spi_dac_tx (
    input  wire         clk_50mhz,
    input  wire         rst_n,
    input  wire [11:0]  dac_data,
    input  wire         trigger,
    output reg          sclk,
    output reg          mosi,
    output reg          cs_n
);
    reg [4:0]  bit_cnt;
    reg [15:0] shift_reg;
    reg        active;

    always @(posedge clk_50mhz or negedge rst_n) begin
        if (!rst_n) begin
            sclk<=1'b0; mosi<=1'b0; cs_n<=1'b1;
            active<=1'b0; bit_cnt<=5'd15; shift_reg<=16'd0;
        end else begin
            if (trigger && !active) begin
                shift_reg<={4'b0011,dac_data}; active<=1'b1;
                cs_n<=1'b0; bit_cnt<=5'd15; sclk<=1'b0;
            end else if (active) begin
                sclk<=~sclk;
                if (!sclk) begin
                    mosi<=shift_reg[15]; shift_reg<=shift_reg<<1;
                    if (bit_cnt==5'd0) active<=1'b0;
                    else bit_cnt<=bit_cnt-1;
                end else begin
                    if (!active) begin cs_n<=1'b1; sclk<=1'b0; end
                end
            end
        end
    end
endmodule
