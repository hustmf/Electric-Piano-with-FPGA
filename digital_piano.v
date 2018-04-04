`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:20:15 06/25/2013 
// Design Name: 
// Module Name:    digital_piano 
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
module digital_piano(inclk, ps2_clk, ps2_data, start, reset, out,ChannelSelect,
							key, record, replay, select, hsync, vsync, vga_r, vga_g, vga_b, anodes, cathodes,YinDiao);

//input timbre;
input [2:0]YinDiao;
input  start, reset;		//系统控制
input  inclk; 				//选用100MM晶振
input  ps2_clk, ps2_data;//PS2控制
input  [3:0] key;			//歌曲选择
input record;
input replay;
input  select;				//歌曲快慢选择
input ChannelSelect;//选择播放歌曲或演奏
output out;
//wire out_r, out_l;		//左右声道，左声道：曲目播放；右声道：电子琴
output [3:0] anodes;		//显示音符
output [6:0] cathodes;   //显示音符
// FPGA与VGA接口信号
output hsync;	//行同步信号
output vsync;	//场同步信号
output[2:0] vga_r;
output[2:0] vga_g;
output[1:0] vga_b;    

wire  clk_5MHz;				//时钟频率5MHz

//assign out=ChannelSelect?out_r:out_l;

//调用子调块
//电子琴弹奏
piano m1(.inclk(inclk), .clk_5MHz(clk_5MHz), .start(start), .reset(reset), .ps2_clk(ps2_clk), .ps2_data(ps2_data), .record(record), .replay(replay), 
			.hsync(hsync), .vsync(vsync), .vga_r(vga_r), .vga_g(vga_g), .vga_b(vga_b),	
			.beep(out), .anodes(anodes), .cathodes(cathodes),.YinDiao(YinDiao[2:0]),.ChannelSelect(ChannelSelect),.key(key[3:0]),.select(select)); 							
//曲目播放，伴奏
//song m2(.clk_5MHz(clk_5MHz), .key(key), .select(select), .beep(out_l));


wire nCLR=1;
Divider F5M(.CLK(inclk),.nCLR(nCLR),.CLK_Out(clk_5MHz));
defparam
    F5M.Out_Freq=5000000;

endmodule
