module divfreq50MHz_100Hz (
    input wire clk_50MHz,
    output reg out_100Hz
);
    reg [25:0] count = 0;

    always @(posedge clk_50MHz) begin
        if (count == 250000) begin
            out_100Hz <= ~out_100Hz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
