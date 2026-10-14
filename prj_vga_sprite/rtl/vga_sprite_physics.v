module vga_sprite_physics (
    input  wire         vsync,
    input  wire         rst_n,
    output reg  [9:0]   sprite_x,
    output reg  [9:0]   sprite_y
);
    parameter [9:0] SCREEN_W=10'd640, SCREEN_H=10'd480, SPRITE_SIZE=10'd32, STEP=10'd2;
    reg x_dir, y_dir;

    wire x_dir_next = (sprite_x >= SCREEN_W - SPRITE_SIZE) ? 1'b1 :
                      (sprite_x == 10'd0)                   ? 1'b0 : x_dir;
    wire y_dir_next = (sprite_y >= SCREEN_H - SPRITE_SIZE) ? 1'b1 :
                      (sprite_y == 10'd0)                   ? 1'b0 : y_dir;

    always @(posedge vsync or negedge rst_n) begin
        if (!rst_n) begin
            sprite_x<=10'd100; sprite_y<=10'd100; x_dir<=1'b0; y_dir<=1'b0;
        end else begin
            x_dir<=x_dir_next; sprite_x<=x_dir_next?(sprite_x-STEP):(sprite_x+STEP);
            y_dir<=y_dir_next; sprite_y<=y_dir_next?(sprite_y-STEP):(sprite_y+STEP);
        end
    end
endmodule
