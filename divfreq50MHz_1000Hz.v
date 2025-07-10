module divfreq50MHz_1000Hz (
    input wire clk_50MHz,
    output reg out_1000Hz
);
    reg [20:0] count = 0;

    always @(posedge clk_50MHz) begin
        if (count == 50000) begin
            out_1000Hz <= ~out_1000Hz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
