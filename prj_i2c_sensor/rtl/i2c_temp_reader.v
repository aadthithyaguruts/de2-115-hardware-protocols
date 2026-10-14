module i2c_temp_reader (
    input  wire         clk_100khz,
    input  wire         rst_n,
    inout  wire         sda,
    inout  wire         scl,
    output reg  [15:0]  temp_data
);
    reg scl_oe = 1, sda_out = 1, sda_dir = 1;
    assign scl = scl_oe  ? 1'bz : 1'b0;
    assign sda = sda_dir ? (sda_out ? 1'bz : 1'b0) : 1'bz;
    wire sda_in = sda;

    parameter [7:0] SLAVE_ADDR_RD = 8'b1001_0001;
    parameter [3:0] IDLE=4'd0, START=4'd1, ADDR=4'd2, ACK1=4'd3,
                    READ_MSB=4'd4, ACK2=4'd5, READ_LSB=4'd6,
                    NACK=4'd7, STOP=4'd8;

    reg [3:0]  state     = IDLE;
    reg [3:0]  bit_cnt   = 4'd0;
    reg [15:0] shift_reg = 16'd0;
    reg [7:0]  addr_shift;

    always @(posedge clk_100khz or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE; scl_oe <= 1; sda_out <= 1; sda_dir <= 1;
            bit_cnt <= 4'd0; shift_reg <= 16'd0; addr_shift <= 8'd0;
        end else begin
            case (state)
                IDLE: begin sda_dir<=1; sda_out<=0; addr_shift<=SLAVE_ADDR_RD; bit_cnt<=4'd7; state<=START; end
                START: begin scl_oe<=0; sda_out<=1; state<=ADDR; end
                ADDR: begin
                    sda_out<=addr_shift[7]; addr_shift<={addr_shift[6:0],1'b0};
                    scl_oe<=~scl_oe;
                    if (!scl_oe && bit_cnt==0) state<=ACK1;
                    else if (!scl_oe) bit_cnt<=bit_cnt-1;
                end
                ACK1: begin sda_dir<=0; scl_oe<=~scl_oe; if (scl_oe) begin state<=READ_MSB; bit_cnt<=4'd7; end end
                READ_MSB: begin
                    sda_dir<=0;
                    if (!scl_oe) begin
                        shift_reg[15:8]<={shift_reg[14:8],sda_in};
                        if (bit_cnt==0) state<=ACK2; else bit_cnt<=bit_cnt-1;
                    end
                    scl_oe<=~scl_oe;
                end
                ACK2: begin sda_dir<=1; sda_out<=0; scl_oe<=~scl_oe; if (scl_oe) begin state<=READ_LSB; bit_cnt<=4'd7; end end
                READ_LSB: begin
                    sda_dir<=0;
                    if (!scl_oe) begin
                        shift_reg[7:0]<={shift_reg[6:0],sda_in};
                        if (bit_cnt==0) state<=NACK; else bit_cnt<=bit_cnt-1;
                    end
                    scl_oe<=~scl_oe;
                end
                NACK: begin sda_dir<=1; sda_out<=1; scl_oe<=~scl_oe; if (scl_oe) state<=STOP; end
                STOP: begin scl_oe<=1; sda_out<=1; temp_data<=shift_reg; state<=IDLE; end
                default: state<=IDLE;
            endcase
        end
    end
endmodule
