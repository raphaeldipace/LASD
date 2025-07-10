`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
// Author: Raphael Di Pace 

//---------- modifique a partir daqui --------

// assign LEDG[0] = KEY[1];

/*som_sub meu_som_sub (.a(SW[3:0]),.b(SW[7:4]),.op(SW[17]),.res(LEDR[3:0]),.overflow(LEDG[0]));
endmodule

module som_sub (input [3:0] a, b, 
	input op,
	output reg [3:0]res, 
	output reg overflow);
	always @ * begin
		case (op)
			1'b0 : res = a + b;
			1'b1 : res = a - b;
		endcase
		case (op)
			0: overflow =(res < a || res < b);
		endcase
	end 

assign HEX0[0:6] = SW[6:0];

decod_hex_7seg decodificador (.hex(SW[11:8]), .seg(HEX3[0:6]));
divfreq50MHz_1Hz divfreq (.clock50(CLOCK_50), .clock1(LEDG[0]));

wire fio1;
wire [3:0] fio2;
divfreq50MHz_1Hz divfreq1 (.clock50(CLOCK_50), .clock1(fio1));
contadorM_10 contador (.clk(fio1), .rst(KEY[1]), .cont(fio2[3:0]));
decod_hex_7seg decodificador1 (.hex(fio2[3:0]), .seg(HEX4[0:6]));

//desafio:
wire fio3;
wire [2:0] fio4;
divfreq50MHz_6Hz divfreq_desafio (.clock50(CLOCK_50), .clock6(fio3));
contadorM_6 contador_desafio (.clk(fio3), .cont(fio4[2:0]));
decod_animacao decod_desafio (.hex(fio4[2:0]), .seg(HEX7[0:6]));

banco_regs banco (.clk(KEY[1]), .rst(KEY[0]), .we3(SW[17]), .ra1(SW[13:11]), .ra2(SW[10:8]), .wa3(SW[16:14]), .wd3(SW[7:0]), .rd1(w_d0x0[7:0]), .rd2(w_d0x1[7:0]));

assign LEDG[8] = ~KEY[1];
assign LEDG[0] = KEY[0];
decod_hex_7seg decod1 (.hex(SW[3:0]), .seg(HEX0));
decod_hex_7seg decod2 (.hex(SW[7:4]), .seg(HEX1));
*/

//sprint 4:

/*wire [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;

assign w_rd1SrcA = w_d0x0;
assign w_rd2 = w_d1x0;
assign w_SrcB = w_d1x1;
assign w_ULAResultWd3 = w_d0x4;

decod_hex_7seg decod1 (.hex(SW[3:0]), .seg(HEX0));
decod_hex_7seg decod2 (.hex(SW[7:4]), .seg(HEX1));

banco_regs banco (.clk(KEY[1]), .rst(KEY[0]), .we3(1'b1), .ra1(SW[13:11]), .ra2(3'b010), .wa3(SW[16:14]), .wd3(SW[7:0]), .rd1(w_rd1SrcA), .rd2(w_rd2));
mux2por1 muxULASrc (.sel(SW[17]), .a(w_rd2), .b(8'h07), .out(w_SrcB));
ULA ula (.srcA(w_rd1SrcA), .srcB(w_SrcB), .ULAControl(SW[10:8]), .ULAResult(w_ULAResultWd3), .flagZ(LEDG[0]));
*/

// sprint 5, 6, 7, 8:
wire w_ULASrc, w_RegWrite, w_MemWrite, w_clock100hz, w_PCSrc, w_Jump, w_Branch, w_Z, w_Jr, w_Jal, w_We;
wire [1:0] w_RegDst, w_MemtoReg;
wire [2:0] w_ULAControl, w_wa3;
wire [7:0] w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_PC, w_PCp1, w_RData, w_wd3, w_m1, w_nPC, w_PCBranch, w_muxJrPC, w_DataIn, w_DataOut, w_RegData;
wire [31:0] w_Inst;

assign w_PC = w_d0x4;
assign LEDR[9] = w_RegWrite;
assign LEDR[8] =  w_RegDst;
assign LEDR[7] = w_ULASrc;
assign LEDR[6:4] = w_ULAControl[2:0];
//assign HEX0 = w_d1x3;
assign w_PCSrc = w_Branch & w_Z;
assign w_DataOut = w_d1x4;
assign w_DataIn = SW[7:0];

divfreq50MHz_100Hz divfreq (.clk_50MHz(CLOCK_50), .out_100Hz(w_clock100hz));

mux2por1 MuxPCSrc (.sel(w_PCSrc), .a(w_PCp1), .b(w_PCBranch), .out(w_m1));

//mux2por1 MuxJump (.sel(w_Jump), .a(w_m1), .b(w_Inst[7:0]), .out(w_nPC));

mux2por1 MuxJal (.sel(w_Jal), .a(w_m1), .b(w_Inst[7:0]), .out(w_nPC));

mux2por1 MuxJr (.sel(w_Jr), .a(w_nPC), .b(w_rd1SrcA), .out(w_muxJrPC));

Adder1 somador (.entrada(w_PC), .enable(1'b1), .saida(w_PCp1));

Adder8Bits adderBranch (.a(w_PCp1), .b(w_Inst[7:0]), .sum(w_PCBranch));

RegPC pc (.clk(w_clock100hz), .rst(KEY[2]), .PCin(w_muxJrPC), .PC(w_PC));

//InstrMemDesafio desafio (.A(w_PC), .RD(w_Inst));
//InstrMem memLeitura (.A(w_PC), .RD(w_Inst));

RomInstMem rom (.address(w_PC), .clock(CLOCK_50), .q(w_Inst));

UnidadeDeControle udc (.OP(w_Inst[31:26]), .Funct(w_Inst[5:0]), .RegWrite(w_RegWrite), .RegDst(w_RegDst), .ULASrc(w_ULASrc), .ULAControl(w_ULAControl), .MemtoReg(w_MemtoReg), .MemWrite(w_MemWrite), .Jump(w_Jump), .Branch(w_Branch), .Jal(w_Jal), .Jr(w_Jr));

RamDataMem ram (.address(w_ULAResultWd3), .clock(CLOCK_50), .data(w_rd2), .wren(w_We), .q(w_RData));

mux4por1 MuxDDest (.sel(w_MemtoReg), .a(w_ULAResultWd3), .b(w_RegData), .c(w_PCp1), .out(w_wd3));

mux4por1 MuxWR (.sel(w_RegDst), .a(w_Inst[20:16]), .b(w_Inst[15:11]), .c(8'h7), .out(w_wa3));

banco_regs banco (.clk(w_clock100hz), .rst(KEY[2]), .we3(w_RegWrite), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]), .wa3(w_wa3), .wd3(w_wd3), .rd1(w_rd1SrcA), .rd2(w_rd2), .S0(w_d0x0), .S1(w_d0x1), .S2(w_d0x2), .S3(w_d0x3), .S4(w_d1x0),
.S5(w_d1x1), .S6(w_d1x2), .S7(w_d1x3));

mux2por1 muxULASrc (.sel(w_ULASrc), .a(w_rd2), .b(w_Inst[7:0]), .out(w_SrcB));

ULA ula (.srcA(w_rd1SrcA), .srcB(w_SrcB), .ULAControl(w_ULAControl), .ULAResult(w_ULAResultWd3), .flagZ(w_Z));

ParallelIN entradaParalela (.Address(w_ULAResultWd3), .MemData(w_RData), .DataIn(w_DataIn), .RegData(w_RegData));

ParallelOUT saidaParalela (.Address(w_ULAResultWd3), .we(w_MemWrite), .RegData(w_rd2), .clk(w_clock100hz), .wren(w_We), .DataOut(w_DataOut));

endmodule 




