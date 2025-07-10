module Adder1(input [7:0] entrada, input enable, output reg [7:0] saida);
    
    always @(entrada or enable) begin
        if(enable)
            saida = entrada + 8'h01;
        else
            saida = 8'h00;
    end
    
endmodule
