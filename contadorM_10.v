module contadorM_10 (input clk, rst,
                    output reg [0:3] cont);
  
   
  
  always @ (posedge clk)
    begin
      if(cont == 4'h9) begin
        cont = 4'h0;
      end
      else begin
        cont = cont + 4'h1;
      end
		if (rst==0)
			begin
				cont = 4'h0;
			end
    end
endmodule
