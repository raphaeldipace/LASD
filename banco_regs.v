module banco_regs(
  input clk,
  input rst,
  input we3, //enable
  input [2:0] ra1, // saida do mux 1 (endereço do registrador que cujo valor vai sair)
  input [2:0] ra2, // saida do mux 2 (endereço do registrador que cujo valor vai sair)
  input [2:0] wa3, // endereço do reg que vai receber o dado
  input [7:0] wd3, // dados a serem escritos
  output reg [7:0] rd1, rd2, // saida dos dados
  output reg [7:0] S0,S1,S2,S3, S4, S5,S6,S7
);

  reg [7:0] regs[7:0];
  
 

  always @(posedge clk) begin
    if(~rst) begin
      regs[0] <= 8'b0;
		regs[1] <= 8'b0;
		regs[2] <= 8'b0;
		regs[3] <= 8'b0;
		regs[4] <= 8'b0;
		regs[5] <= 8'b0;
		regs[6] <= 8'b0;
		regs[7] <= 8'b0;
    end
    else begin
      if(wa3 != 3'b000 && we3 == 1) begin
        regs[wa3] <= wd3;
      end
    end
  end
  
  always @(*) begin
	  rd1 = regs[ra1];
	  rd2 = regs[ra2];
	  S0 = regs[0];
	  S1 = regs[1];
	  S2 = regs[2];
	  S3 = regs[3];
	  S4 = regs[4];
	  S5 = regs[5];
	  S6 = regs[6];
	  S7 = regs[7]; 
  end

endmodule
