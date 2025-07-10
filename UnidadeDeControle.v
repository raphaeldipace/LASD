module UnidadeDeControle(
	input [5:0] OP, Funct, 
	output reg RegWrite, ULASrc, Branch, MemWrite, Jump, Jal, Jr,
	output reg [1:0] MemtoReg, RegDst,
	output reg [2:0] ULAControl
);

    always @* begin
        case(OP)
            6'b000000: begin // Instruções tipo R
                case(Funct)
                    6'b100000: begin // ADD
							RegWrite = 1;
                    	RegDst = 1;
                   	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b010;
                    end
                    6'b100010: begin // SUB
                    	RegWrite = 1;
                    	RegDst = 1;
                    	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b110;
                    end
                    6'b100100: begin // AND
                    	RegWrite = 1;
                    	RegDst = 1;
                    	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b000; 
                    end
                    6'b100101: begin // OR
                    	RegWrite = 1;
                    	RegDst = 1;
                    	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b001; 
                    end
                    6'b100111: begin // NOR
                    	RegWrite = 1;
                    	RegDst = 1;
                    	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b011; 
                    end
                    6'b101010: begin // SLT
                    	RegWrite = 1;
                    	RegDst = 1;
                    	Branch = 0;
                    	MemWrite = 0;
                    	MemtoReg = 0;
                    	Jump = 0;
                    	ULASrc = 0;
                    	Jal = 0;
                    	Jr = 0;
                    	ULAControl = 3'b111; 
                    end
                    6'b001000: begin // JR
                        RegWrite = 0;
                        RegDst = 0;
                        ULASrc = 0;
                        ULAControl = 3'b000;
                        Branch = 0;
                        MemWrite = 0;
                        MemtoReg = 0;
                        Jal = 0;
                        Jr = 1;
                    end
                    default: begin
                    	RegWrite = 0;
                    	RegDst = 0;
                    	ULASrc = 0;
                    	Branch = 0;
							MemWrite = 0;
							MemtoReg = 0;
							Jump = 0;
							Jal = 0;
							Jr = 0; 
                    	ULAControl = 3'b000;
						end
                endcase
					end
            6'b100011: begin // LW
                RegWrite = 1;
                ULASrc = 1;
                ULAControl = 3'b010;
                MemtoReg = 1;
                RegDst = 0;
                Branch = 0;
                MemWrite = 0;
                Jump = 0;
                Jal = 0;
					 Jr = 0;
            end
            6'b101011: begin // SW
                ULASrc = 1;
                ULAControl = 3'b010;
                MemWrite = 1;
					 RegWrite = 0;
                Branch = 0;
                Jump = 0;
                Jal = 0;
					 Jr = 0;
            end
            6'b000100: begin // BEQ
                ULAControl = 3'b110;
                Branch = 1;
					 RegWrite = 0;
                ULASrc = 0;
                MemWrite = 0;
                Jump = 0;
                Jal = 0;
					 Jr = 0;
            end
            6'b001000: begin // ADDi
                RegWrite = 1;
                ULASrc = 1;
                ULAControl = 3'b010;
                RegDst = 0;
                Branch = 0;
                MemWrite = 0;
                MemtoReg = 0;
                Jump = 0;
                Jal = 0;
					 Jr = 0;
            end
            6'b000010: begin // J
				RegWrite = 0;
				MemWrite = 0;
				Jump = 1;
				Jal = 0;
				Jr = 0;	
            end
            6'b000011: begin // JAL
                RegWrite = 1;
                RegDst = 2'b10;
                ULASrc = 0;
                ULAControl = 3'b000;
                Branch = 0;
                MemWrite = 0;
                MemtoReg = 2'b10;
                Jal = 1;
                Jr = 0;
				end
            default: begin
                RegWrite = 0;
                RegDst = 0;
                ULASrc = 0;
                ULAControl = 3'b000;
                Branch = 0;
                MemWrite = 0;
                MemtoReg = 0;
                Jump = 0;
                Jal = 0;
					 Jr = 0;
            end
        endcase
		end
endmodule
