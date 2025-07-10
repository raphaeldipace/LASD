module Adder8Bits(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] sum
);
    assign sum = a + b;
endmodule
