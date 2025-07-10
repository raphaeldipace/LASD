module divfreq50MHz_1Hz(input clock50,
                        output reg clock1);
  reg [0:25] cont;
  
  initial 
    begin
      cont = 26'd0;
    end
  
  always @ (posedge clock50)
    begin
      if(cont == 26'd50000000) begin
        clock1 = 1'b1;
        cont = 26'd0;
      end
      else begin
        cont = cont + 26'd1;
      end
      if(cont == 26'd25000000) begin
        clock1 = 1'b0;
      end
    end

endmodule