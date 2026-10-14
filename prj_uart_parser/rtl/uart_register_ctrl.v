module uart_register_ctrl (
    input  wire         clk_50mhz,
    input  wire         rst_n,
    input  wire [7:0]   rx_byte,
    input  wire         rx_valid,
    output reg  [127:0] reg_bank
);
    reg [1:0] state;
    reg [7:0] cmd_buf, addr_buf;
    parameter [1:0] ST_CMD  = 2'b00, ST_ADDR = 2'b01, ST_DATA = 2'b10;
    parameter [7:0] CMD_WRITE = 8'h57;

    always @(posedge clk_50mhz or negedge rst_n) begin
        if (!rst_n) begin
            state <= ST_CMD; cmd_buf <= 8'h00; addr_buf <= 8'h00;
            reg_bank <= 128'h0;
        end else if (rx_valid) begin
            case (state)
                ST_CMD:  begin cmd_buf  <= rx_byte; state <= ST_ADDR; end
                ST_ADDR: begin addr_buf <= rx_byte; state <= ST_DATA; end
                ST_DATA: begin
                    if (cmd_buf == CMD_WRITE && addr_buf < 8'd16)
                        reg_bank[addr_buf * 8 +: 8] <= rx_byte;
                    state <= ST_CMD;
                end
                default: state <= ST_CMD;
            endcase
        end
    end
endmodule
