`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:50:33 06/30/2013 
// Design Name: 
// Module Name:    recordmode 
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
module recordmode(clk_5MHz, record, replay, ps2_asci, record_asci);
input clk_5MHz;                 	//输入驱动时钟信号
input record;							//录音开关
input replay;							//回放开关
input [7:0] ps2_asci;				//输入的键盘按键的asciii码值
output reg [7:0] record_asci;		//当replay为“1”时，输出的采样的键值

reg [25:0] count_for_16Hz;			//分频计数器
reg clk_16Hz;

reg [7:0] mem [127:0]; 				//存储采样值的内存区域
reg [6:0] count;						//存储计数器

//获得16Hz的采样频率
always@(posedge clk_5MHz)
begin
	if(count_for_16Hz==156250)
		begin
			count_for_16Hz <= 26'd0;
			clk_16Hz <= ~clk_16Hz;
		end
	else
		begin
			count_for_16Hz <= count_for_16Hz + 26'b1;
		end
end

//当record为“1”时，将键盘输出的键值存入到mem内存区域中
always@(posedge clk_16Hz)
begin
	if(record == 1'b1)
	begin
		count <= count + 7'b1;
		mem[count] <= ps2_asci;
	end
end

//将存储的键值输出
always@(count)
begin
	record_asci <= mem[count];
end
endmodule
