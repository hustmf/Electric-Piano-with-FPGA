`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:42 06/30/2013 
// Design Name: 
// Module Name:    VGA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA(inclk, clk_5MHz, reset, origin, hsync, vsync, vga_r, vga_g, vga_b);

input inclk, clk_5MHz;
input reset;	//低电平复位
input [13:0]origin;

// FPGA与VGA接口信号
output hsync;	//行同步信号
output vsync;	//场同步信号
output[2:0] vga_r;
output[2:0] vga_g;
output[1:0] vga_b;

reg[23:0] char_line0;
reg[23:0] char_line1;
reg[23:0] char_line2; 
reg[23:0] char_line3; 
reg[23:0] char_line4; 
reg[23:0] char_line5; 
reg[23:0] char_line6; 
reg[23:0] char_line7; 
reg[23:0] char_line8; 
reg[23:0] char_line9; 
reg[23:0] char_linea; 
reg[23:0] char_lineb; 
reg[23:0] char_linec; 
reg[23:0] char_lined; 
reg[23:0] char_linee; 
reg[23:0] char_linef;

vga_char m( .clk(inclk), .rst_n(reset),	//系统控制
				.hsync(hsync), .vsync(vsync), .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b),	// VGA控制
				.char_line0(char_line0), .char_line1(char_line1), .char_line2(char_line2), .char_line3(char_line3), 
				.char_line4(char_line4), .char_line5(char_line5), .char_line6(char_line6), .char_line7(char_line7), 
				.char_line8(char_line8), .char_line9(char_line9), .char_linea(char_linea), .char_lineb(char_lineb), 
				.char_linec(char_linec), .char_lined(char_lined), .char_linee(char_linee), .char_linef(char_linef)
				);

always @ (posedge clk_5MHz)
	begin
		case (origin)  
			6826:   //Q Hdo
				begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70600;
char_line4 = 24'h420200;
char_line5 = 24'h420200;
char_line6 = 24'h420200;
char_line7 = 24'h421e3c;
char_line8 = 24'h7e2242;
char_line9 = 24'h424242;
char_linea = 24'h424242;
char_lineb = 24'h424242;
char_linec = 24'h422642;
char_lined = 24'he71b3c;
char_linee = 24'h000000;
char_linef = 24'h000000;
				end
					
			7871:   //W Hre
				begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70000;
char_line4 = 24'h420000;
char_line5 = 24'h420000;
char_line6 = 24'h420000;
char_line7 = 24'h42ee3c;
char_line8 = 24'h7e3242;
char_line9 = 24'h42207e;
char_linea = 24'h422040;
char_lineb = 24'h422040;
char_linec = 24'h422040;
char_lined = 24'he7f83c;
char_linee = 24'h000000;
char_linef = 24'h000000;
				end
			8798:   //E Hmi
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70030;
char_line4 = 24'h420030;
char_line5 = 24'h420000;
char_line6 = 24'h420000;
char_line7 = 24'h42fe70;
char_line8 = 24'h7e4910;
char_line9 = 24'h424910;
char_linea = 24'h424910;
char_lineb = 24'h424910;
char_linec = 24'h424910;
char_lined = 24'he7ed7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
end
			9224:   //R Hfa
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70f00;
char_line4 = 24'h421100;
char_line5 = 24'h421000;
char_line6 = 24'h421000;
char_line7 = 24'h427e3c;
char_line8 = 24'h7e1042;
char_line9 = 24'h42101e;
char_linea = 24'h421022;
char_lineb = 24'h421042;
char_linec = 24'h421042;
char_lined = 24'he77c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			10005:   //T Hso
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70000;
char_line4 = 24'h420000;
char_line5 = 24'h420000;
char_line6 = 24'h420000;
char_line7 = 24'h423e3c;
char_line8 = 24'h7e4242;
char_line9 = 24'h424042;
char_linea = 24'h423c42;
char_lineb = 24'h420242;
char_linec = 24'h424242;
char_lined = 24'he77c3c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			10701:   //Y Hla
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he77000;
char_line4 = 24'h421000;
char_line5 = 24'h421000;
char_line6 = 24'h421000;
char_line7 = 24'h42103c;
char_line8 = 24'h7e1042;
char_line9 = 24'h42101e;
char_linea = 24'h421022;
char_lineb = 24'h421042;
char_linec = 24'h421042;
char_lined = 24'he77c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			11321:   //U Hsi
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he70030;
char_line4 = 24'h420030;
char_line5 = 24'h420000;
char_line6 = 24'h420000;
char_line7 = 24'h423e70;
char_line8 = 24'h7e4210;
char_line9 = 24'h424010;
char_linea = 24'h423c10;
char_lineb = 24'h420210;
char_linec = 24'h424210;
char_lined = 24'he77c7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			//8'h43: count_end <= 8'h49;   //I
			//8'h44: count_end <= 8'h4f;   //O
			//8'h4d: count_end <= 8'h50;   //P               
			
			11606:   //A Mdo
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0600;
char_line4 = 24'h6c0200;
char_line5 = 24'h6c0200;
char_line6 = 24'h6c0200;
char_line7 = 24'h6c1e3c;
char_line8 = 24'h542242;
char_line9 = 24'h544242;
char_linea = 24'h544242;
char_lineb = 24'h544242;
char_linec = 24'h542642;
char_lined = 24'hd61b3c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			12126:   //S Mre
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0000;
char_line4 = 24'h6c0000;
char_line5 = 24'h6c0000;
char_line6 = 24'h6c0000;
char_line7 = 24'h6cee3c;
char_line8 = 24'h543242;
char_line9 = 24'h54207e;
char_linea = 24'h542040;
char_lineb = 24'h542040;
char_linec = 24'h542042;
char_lined = 24'hd6f83c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			12591:   //D Mmi
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0030;
char_line4 = 24'h6c0030;
char_line5 = 24'h6c0000;
char_line6 = 24'h6c0000;
char_line7 = 24'h6cfe70;
char_line8 = 24'h544910;
char_line9 = 24'h544910;
char_linea = 24'h544910;
char_lineb = 24'h544910;
char_linec = 24'h544910;
char_lined = 24'hd6ed7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			12804:   //F Mfa
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0f00;
char_line4 = 24'h6c1100;
char_line5 = 24'h6c1000;
char_line6 = 24'h6c1000;
char_line7 = 24'h6c7e3c;
char_line8 = 24'h541042;
char_line9 = 24'h54101e;
char_linea = 24'h541022;
char_lineb = 24'h541042;
char_linec = 24'h541042;
char_lined = 24'hd67c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			13194:   //G Mso
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0000;
char_line4 = 24'h6c0000;
char_line5 = 24'h6c0000;
char_line6 = 24'h6c0000;
char_line7 = 24'h6c3e3c;
char_line8 = 24'h544242;
char_line9 = 24'h544042;
char_linea = 24'h543c42;
char_lineb = 24'h540242;
char_linec = 24'h544242;
char_lined = 24'hd67c3c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			13524:   //H Mla
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee7000;
char_line4 = 24'h6c1000;
char_line5 = 24'h6c1000;
char_line6 = 24'h6c1000;
char_line7 = 24'h6c103c;
char_line8 = 24'h541042;
char_line9 = 24'h54101e;
char_linea = 24'h541022;
char_lineb = 24'h541042;
char_linec = 24'h541042;
char_lined = 24'hd67c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			13852:
begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'hee0030;
char_line4 = 24'h6c0030;
char_line5 = 24'h6c0000;
char_line6 = 24'h6c0000;
char_line7 = 24'h6c3e70;
char_line8 = 24'h544210;
char_line9 = 24'h544010;
char_linea = 24'h543c10;
char_lineb = 24'h540210;
char_linec = 24'h544210;
char_lined = 24'hd67c7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
end			//J Msi
			//8'h42: key_outt <= 7'b1111110;   //K
			//8'h4b: key_out <= 7'b1111110;   //L
			
			13994:   //Z Ldo
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00600;
char_line4 = 24'h400200;
char_line5 = 24'h400200;
char_line6 = 24'h400200;
char_line7 = 24'h401e3c;
char_line8 = 24'h402242;
char_line9 = 24'h404242;
char_linea = 24'h404242;
char_lineb = 24'h404242;
char_linec = 24'h422642;
char_lined = 24'hfe1b3c;
char_linee = 24'h000000;
char_linef = 24'h000000;			
			end
			14255:   //X Lre
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00000;
char_line4 = 24'h400000;
char_line5 = 24'h400000;
char_line6 = 24'h400000;
char_line7 = 24'h40ee3c;
char_line8 = 24'h403242;
char_line9 = 24'h40207e;
char_linea = 24'h402040;
char_lineb = 24'h402040;
char_linec = 24'h422042;
char_lined = 24'hfef83c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			14487:   //C Lmi
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00030;
char_line4 = 24'h400030;
char_line5 = 24'h400000;
char_line6 = 24'h400000;
char_line7 = 24'h40fe70;
char_line8 = 24'h404910;
char_line9 = 24'h404910;
char_linea = 24'h404910;
char_lineb = 24'h404910;
char_linec = 24'h424910;
char_lined = 24'hfeed7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			14593:   //V Lfa
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00f00;
char_line4 = 24'h401100;
char_line5 = 24'h401000;
char_line6 = 24'h401000;
char_line7 = 24'h407e3c;
char_line8 = 24'h401042;
char_line9 = 24'h40101e;
char_linea = 24'h401022;
char_lineb = 24'h401042;
char_linec = 24'h421042;
char_lined = 24'hfe7c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			14789:   //B Lso
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00000;
char_line4 = 24'h400000;
char_line5 = 24'h400000;
char_line6 = 24'h400000;
char_line7 = 24'h403e3c;
char_line8 = 24'h404242;
char_line9 = 24'h404042;
char_linea = 24'h403c42;
char_lineb = 24'h400242;
char_linec = 24'h424242;
char_lined = 24'hfe7c3c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			14963:   //N Lla
			begin
			char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he07000;
char_line4 = 24'h401000;
char_line5 = 24'h401000;
char_line6 = 24'h401000;
char_line7 = 24'h40103c;
char_line8 = 24'h401042;
char_line9 = 24'h40101e;
char_linea = 24'h401022;
char_lineb = 24'h401042;
char_linec = 24'h421042;
char_lined = 24'hfe7c3f;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			15117:   //M Lsi
			begin
char_line0 = 24'h000000; 
char_line1 = 24'h000000;
char_line2 = 24'h000000;
char_line3 = 24'he00030;
char_line4 = 24'h400030;
char_line5 = 24'h400000;
char_line6 = 24'h400000;
char_line7 = 24'h403e70;
char_line8 = 24'h404210;
char_line9 = 24'h404010;
char_linea = 24'h403c10;
char_lineb = 24'h400210;
char_linec = 24'h424210;
char_lined = 24'hfe7c7c;
char_linee = 24'h000000;
char_linef = 24'h000000;
			end
			default: 
				begin
					char_line0 = 24'h999999;
					char_line1 = 24'h999999;
					char_line2 = 24'h999999;
					char_line3 = 24'h999999;
					char_line4 = 24'h999999;
					char_line5 = 24'h999999;
					char_line6 = 24'h999999;
					char_line7 = 24'hffffff;
					char_line8 = 24'hffffff;
					char_line9 = 24'hffffff;
					char_linea = 24'hffffff;
					char_lineb = 24'hffffff;
					char_linec = 24'hffffff;
					char_lined = 24'hffffff;
					char_linee = 24'hffffff;
					char_linef = 24'hffffff;
				end			
		endcase
	end	
endmodule
