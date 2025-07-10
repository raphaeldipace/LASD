module ParallelOUT (
  input [7:0] Address,
  input we,
  input [7:0] RegData,
  input clk,
  output reg wren,
  output reg [7:0] DataOut
);
  
  always @* begin
    if (Address != 8'hFF && we) begin  
      wren = 1;
    end else begin
      wren = 0;
    end   
  end
  
  always @(posedge clk) begin
    if (Address == 8'hFF && we) begin
      DataOut <= RegData;
    end
  end
endmodule
