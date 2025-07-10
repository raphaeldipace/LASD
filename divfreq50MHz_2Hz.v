module divfreq50MHz_2Hz (
    input wire clk_50MHz,
    output reg out_2Hz
);
    reg [25:0] count = 0;

    always @(posedge clk_50MHz) begin
        if (count == 12500000) begin
            out_2Hz <= ~out_2Hz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule
