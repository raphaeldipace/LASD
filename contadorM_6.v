module contadorM_6 (input clk,
                    output reg [0:2] cont);
  
   
  
  always @ (posedge clk)
    begin
      if(cont == 3'h6) begin
        cont = 3'h0;
      end
      else begin
        cont = cont + 3'h1;
      end
    end
endmodule