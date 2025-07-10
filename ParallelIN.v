module ParallelIN(
  input Address,
  input [7:0] MemData, DataIn,
  output reg [7:0] RegData
);

  always @ (Address, MemData, DataIn)
    case (Address)
      1'b0: RegData = MemData;
      1'b1: RegData = DataIn;
      default: RegData = 8'hzz;
    endcase
  
endmodule
