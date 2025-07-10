module ULA(
  input [7:0] srcA, srcB,
  input [2:0] ULAControl,
  output reg [7:0] ULAResult,
  output reg flagZ
);

  always @(*) begin
    case(ULAControl)
      3'b000: ULAResult = srcA & srcB;
      3'b001: ULAResult = srcA | srcB;
      3'b010: ULAResult = srcA + srcB;
      3'b011: ULAResult = ~(srcA | srcB);
      3'b110: ULAResult = srcA + ~srcB + 1;
      3'b111: ULAResult = (srcA < srcB) ? 8'b00000001 : 8'b00000000;
      default: ULAResult = 8'b00000000;
    endcase
	 flagZ = (ULAResult == 8'b00000000) ? 1'b1 : 1'b0;
	 end

  
  
endmodule
