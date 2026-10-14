module fc_mac_element (
    input  wire               clk,
    input  wire               rst_n,
    input  wire               enable,
    input  wire               clear,
    input  wire signed [7:0]  activation,
    input  wire signed [7:0]  weight,
    output reg  signed [31:0] accumulation
);
    wire signed [15:0] product;
    assign product = activation * weight;
    wire signed [31:0] product_ext;
    assign product_ext = {{16{product[15]}}, product};

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)       accumulation <= 32'sd0;
        else if (clear)   accumulation <= 32'sd0;
        else if (enable)  accumulation <= accumulation + product_ext;
    end
endmodule
