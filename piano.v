`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:09:24 06/24/2013 
// Design Name: 
// Module Name:    piano 
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

//piano子模块
module piano(inclk, clk_5MHz, start, reset, ps2_clk, ps2_data, record, replay, 
				hsync, vsync, vga_r, vga_g, vga_b, beep, anodes, cathodes,YinDiao,ChannelSelect,key,select);

input  inclk;
input  clk_5MHz;
input  start, reset;
input  ps2_clk, ps2_data;
input  record, replay;
input[2:0]YinDiao;
input  [3:0] key;			//歌曲选择
input  select;				//歌曲快慢选择
input ChannelSelect;//选择播放歌曲或演奏
output beep;  
output [3:0] anodes;
output [6:0] cathodes;
// FPGA与VGA接口信号
output hsync;	//行同步信号
output vsync;	//场同步信号
output[2:0] vga_r;
output[2:0] vga_g;
output[1:0] vga_b;                              

wire [7:0] key_out;
reg [4:0]Yinfu;
//wire [13:0] led;
wire CP;
reg [13:0] origin;	
	
				     //输出音乐
//assign led = origin;

keyboard m1(.sys_clk(clk_5MHz), .k_clock(ps2_clk), .k_data(ps2_data), .record(record), .replay(replay), .out(key_out));
display m2(.clk(clk_5MHz), .origin(origin), .anodes(anodes), .cathodes(cathodes));
VGA m3(.inclk(inclk), .clk_5MHz(clk_5MHz), .reset(reset), .origin(origin), 
		.hsync(hsync), .vsync(vsync), .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b));
/*****************************************************************************/
Divider F(.CLK(inclk),.nCLR(1),.CLK_Out(CP));
defparam
    F.Out_Freq=2;
always @ (posedge CP or posedge key_out[7] or posedge key_out[6] or posedge key_out[5] or posedge key_out[4] or posedge key_out[3] or posedge key_out[2] or posedge key_out[1] or posedge key_out[0])
	begin
		case (key_out[7:0])  
			8'h51: begin origin<=6826;  Yinfu=5'b01110;end //Q Hdo
			8'h57: begin origin<=7871;  Yinfu=5'b01111;end  //W Hre
			8'h45: begin origin<=8798;  Yinfu=5'b10000;end //E Hmi
			8'h52: begin origin<=9224;  Yinfu=5'b10001;end //R Hfa
			8'h54: begin origin<=10005; Yinfu=5'b10010;end   //T Hso
			8'h59: begin origin<=10701; Yinfu=5'b10011;end   //Y Hla
			8'h55: begin origin<=11321; Yinfu=5'b10100;end  //U Hsi
			//8'h43: count_end <= 8'h49;   //I
			//8'h44: count_end <= 8'h4f;   //O
			//8'h4d: count_end <= 8'h50;   //P               
			
			8'h41: begin origin<=11606; Yinfu=5'b00111;end   //A Mdo
			8'h53: begin origin<=12126; Yinfu=5'b01000;end   //S Mre
			8'h44: begin origin<=12591; Yinfu=5'b01001;end   //D Mmi
			8'h46: begin origin<=12804; Yinfu=5'b01010;end  //F Mfa
			8'h47: begin origin<=13194; Yinfu=5'b01011;end   //G Mso
			8'h48: begin origin<=13524; Yinfu=5'b01100;end   //H Mla
			8'h4a: begin origin<=13852; Yinfu=5'b01101;end   //J Msi
			//8'h42: key_outt <= 7'b1111110;   //K
			//8'h4b: key_out <= 7'b1111110;   //L
			
			8'h5a: begin origin<=13994; Yinfu=5'b00000;end   //Z Ldo
			8'h58: begin origin<=14255; Yinfu=5'b00001;end  //X Lre
			8'h43: begin origin<=14487; Yinfu=5'b00010;end   //C Lmi
			8'h56: begin origin<=14593; Yinfu=5'b00011;end   //V Lfa
			8'h42: begin origin<=14789; Yinfu=5'b00100;end   //B Lso
			8'h4e: begin origin<=14963; Yinfu=5'b00101;end   //N Lla
			8'h4d: begin origin<=15117; Yinfu=5'b00110;end   //M Lsi
			
			default: begin origin<=16383;Yinfu=5'b10101;end
		endcase
	end	


/***********乐曲部分**********************/
wire[4:0]SongData;
reg [1:0]flag;
wire[4:0]out1,out2,out3;
wire clk;
wire clk_2Hz,clk_4Hz,clk_5Hz,clk_6Hz;
assign SongData = (key == 4'b0001)?out1:
					 (key==4'b0010)?out2:
					 (key==4'b0100)?out3:5'b10101;
initial flag = 2'b0; 
always@(negedge select)
begin
	flag <= flag + 2'b1;
end
assign clk = (flag == 2'd0)?clk_2Hz:
				 (flag == 2'd1)?clk_4Hz:
				 (flag == 2'd2)?clk_5Hz:
				 (flag == 2'd3)?clk_6Hz:0;

Divider F2(.CLK(inclk),.nCLR(1),.CLK_Out(clk_2Hz));
defparam
    F2.Out_Freq=2;
Divider F4(.CLK(inclk),.nCLR(1),.CLK_Out(clk_4Hz));
defparam
    F4.Out_Freq=4;
Divider F5(.CLK(inclk),.nCLR(1),.CLK_Out(clk_5Hz));
defparam
    F5.Out_Freq=5;
Divider F6(.CLK(inclk),.nCLR(1),.CLK_Out(clk_6Hz));
defparam
    F6.Out_Freq=6;	 
wire[7:0]musicdata;

wire[4:0]YinFu;
assign YinFu=ChannelSelect?Yinfu:SongData;
song1 Music1(.clk(clk),.ifplay(key[0]),.SongData(out1[4:0]));
song2 Music2(.clk(clk),.ifplay(key[1]),.SongData(out2[4:0]));
song3 Music3(.clk(clk),.ifplay(key[2]),.SongData(out3[4:0]));
sin S0(.CP(inclk),.YinDiao(YinDiao[2:0]),.YinFu(YinFu[4:0]),.musicdata(musicdata[7:0]));

PWM_Out P0(.musicdata(musicdata[7:0]),.CP(inclk),.PWM_Out(beep));

endmodule
