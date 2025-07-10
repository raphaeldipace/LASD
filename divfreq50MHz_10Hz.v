module divfreq50MHz_10Hz (
    input wire clk_50MHz,
    output reg out_10Hz
);
    reg [26:0] count = 0;

    always @(posedge clk_50MHz) begin
        if (count == 5000000) begin
            out_10Hz <= ~out_10Hz;
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
endmodule