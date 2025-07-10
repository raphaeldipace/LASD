module RegPC (
  input clk, rst,
  input [7:0] PCin,
  output reg [7:0] PC
);
  
  always @(posedge clk) begin
    if (rst == 0) 
      PC <= 8'h00;
    else
      PC <= PCin;
  end
endmodule
