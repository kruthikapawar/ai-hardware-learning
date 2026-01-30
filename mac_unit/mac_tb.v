module mac_tb;

    reg clk;
    reg reset;
    reg enable;
    reg [7:0] x;
    reg [7:0] w;
    wire [15:0] acc;

    mac_unit uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .x(x),
        .w(w),
        .acc(acc)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | acc=%d", $time, acc);

        clk = 0;
        reset = 1;
        enable = 0;
        x = 0;
        w = 0;

        #10 reset = 0;
        enable = 1;

        #10 x = 2; w = 3;
        #10 x = 4; w = 5;
        #10 x = 6; w = 7;

        #30 $finish;
    end

endmodule
