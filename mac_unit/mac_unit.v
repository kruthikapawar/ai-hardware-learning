module mac_unit (
    input  wire        clk,
    input  wire        reset,
    input  wire        enable,
    input  wire [7:0]  x,
    input  wire [7:0]  w,
    output reg  [15:0] acc
);

    wire [15:0] mult_result;

    assign mult_result = x * w;

    always @(posedge clk) begin
        if (reset) begin
            acc <= 16'd0;
        end else if (enable) begin
            acc <= acc + mult_result;
        end
    end

endmodule
