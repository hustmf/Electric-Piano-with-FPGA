`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company		: 
// Engineer		: 
// Create Date	: 2013.06.29
// Design Name	: 
// Module Name	: vga_char
// Project Name	: 
// Target Device: 
// Tool versions: 
// Description	: 
// Revision		: V1.0
// Additional Comments	:  
// 
////////////////////////////////////////////////////////////////////////////////
module vga_char(	
				  clk,rst_n,	//系统控制
				  hsync,vsync,vga_r,vga_g,vga_b,	// VGA控制
			     char_line0, char_line1, char_line2, char_line3, char_line4, char_line5, char_line6, char_line7, 
				  char_line8, char_line9, char_linea, char_lineb, char_linec, char_lined, char_linee, char_linef
				);

input clk;	// 50MHz 25MHz
input rst_n;	//低电平复位
input[23:0] char_line0; 
input[23:0] char_line1;
input[23:0] char_line2; 
input[23:0] char_line3; 
input[23:0] char_line4; 
input[23:0] char_line5; 
input[23:0] char_line6; 
input[23:0] char_line7; 
input[23:0] char_line8; 
input[23:0] char_line9; 
input[23:0] char_linea; 
input[23:0] char_lineb; 
input[23:0] char_linec; 
input[23:0] char_lined; 
input[23:0] char_linee; 
input[23:0] char_linef;
// FPGA与VGA接口信号
output hsync;	//行同步信号
output vsync;	//场同步信号
output[2:0] vga_r;
output[2:0] vga_g;
output[1:0] vga_b;

//--------------------------------------------------
// 坐标计数
reg[9:0] x_cnt;		//行坐标
reg[9:0] y_cnt;		//列坐标
reg[4:0] row;       //行计数器
reg[4:0] col;       //列计数器
reg[4:0] c;
reg[4:0] r;
reg [23:0] char_line; 
reg D;              //寄存器输出

//wire clk_25m;

//frq m(.clk(clk), .rst_n(rst_n), .clk_25m(clk_25m));//分频
//reg cnt;
reg clk_25m;
reg clk_50m;
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
			clk_50m <= 1'b0;
	else
		clk_50m <= ~clk_50m;
end

always@ (posedge clk_50m or negedge rst_n)
begin
	if(!rst_n)
			clk_25m <= 1'b0;
	else
		clk_25m <= ~clk_25m;
end

always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) x_cnt <= 10'd17;
	else if(x_cnt == 10'd799) x_cnt <= 10'd17;
	else x_cnt <= x_cnt+1'b1;

always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) y_cnt <= 10'd0;
	else if(y_cnt == 10'd524) y_cnt <= 10'd0;
	else if(x_cnt == 10'd799) y_cnt <= y_cnt+1'b1;  
           
//--------------------------------------------------
// VGA行同步,场同步信号
reg hsync_r,vsync_r;	//同步信号
 
always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) hsync_r <= 1'b1;								
	else if(x_cnt == 10'd17) hsync_r <= 1'b0;	//产生hsync信号
	else if(x_cnt == 10'd96) hsync_r <= 1'b1;

always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) vsync_r <= 1'b1;							  
	else if(y_cnt == 10'd0) vsync_r <= 1'b0;	//产生vsync信号
	else if(y_cnt == 10'd2) vsync_r <= 1'b1;

assign hsync = hsync_r;
assign vsync = vsync_r;

//--------------------------------------------------
//有效显示标志位产生
reg valid_yr;	//行显示有效信号                      //32-512为协议规定的有效显示区
always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) valid_yr <= 1'b0;
	else if(y_cnt == 10'd32) valid_yr <= 1'b1;
	else if(y_cnt == 10'd512) valid_yr <= 1'b0;	

wire valid_y = valid_yr;

reg valid_r;	// VGA有效显示区标志位
always @ (posedge clk_25m or negedge rst_n)
	if(!rst_n) valid_r <= 1'b0;
	else if((x_cnt == 10'd141) && valid_y) valid_r <= 1'b1;
	else if((x_cnt == 10'd782) && valid_y) valid_r <= 1'b0;
	
wire valid = valid_r;		

wire[9:0] x_dis;		//横坐标显示有效区域相对坐标值0-639
wire[9:0] y_dis;		//竖坐标显示有效区域相对坐标值0-479

assign x_dis = x_cnt - 10'd142;
assign y_dis = y_cnt - 10'd33;
//--------------------------------------------------

//-------------------------------------------------- 
	// VGA色彩信号产生
/*
RGB = 000  	黑色	RGB = 100	红色
	= 001  	蓝色		= 101	紫色
	= 010	绿色		= 110	黄色
	= 011	青色		= 111	白色
*/	

/*EDN字模参数*/

/****************************************************************************************/
/*
parameter 	char_line0 = 24'h000000,
				char_line1 = 24'h000000,
				char_line2 = 24'h000000,
				char_line3 = 24'hfcf8c7,
				char_line4 = 24'h424462,
				char_line5 = 24'h484262,
				char_line6 = 24'h484252,
				char_line7 = 24'h784252,
				char_line8 = 24'h48424a,
				char_line9 = 24'h48424a,
				char_linea = 24'h40424a,
				char_lineb = 24'h424246,
				char_linec = 24'h424446,
				char_lined = 24'hfcf8e2,
				char_linee = 24'h000000,
				char_linef = 24'h000000;
*/			
/****************************************************************************************/

// H(0) i(1) 1(2)
//
//{0x00,0x00,0x00,0xF7,0x63,0x63,0x63,0x63},
//{0x7F,0x63,0x63,0x63,0x63,0xF7,0x00,0x00},/*"H",0*/
//
//{0x00,0x00,0x00,0x38,0x38,0x00,0x00,0x78},
//{0x18,0x18,0x18,0x18,0x18,0x7E,0x00,0x00},/*"i",1*/
//
//{0x00,0x00,0x00,0x18,0x78,0x18,0x18,0x18},
//{0x18,0x18,0x18,0x18,0x18,0x7E,0x00,0x00},/*"1",2*/

//parameter 	char_line0 = 24'h000000,
//				char_line1 = 24'h000000,
//				char_line2 = 24'h000000,
//				char_line3 = 24'hF73818,
//				char_line4 = 24'h633878,
//				char_line5 = 24'h630018,
//				char_line6 = 24'h630018,
//				char_line7 = 24'h637818,
//				char_line8 = 24'h7F1818,
//				char_line9 = 24'h631818,
//				char_linea = 24'h631818,
//				char_lineb = 24'h631818,
//				char_linec = 24'h631818,
//				char_lined = 24'hF77E7E,
//				char_linee = 24'h000000,
//				char_linef = 24'h000000;
	  	
reg[7:0] vga_rgb;	// VGA色彩显示寄存器

 /****************************************************************************************/  
 
always @(posedge clk_25m)
      if(!rst_n)
		       col <= 0;
		else	   
	      if (y_dis >=10'd0 && y_dis <= 479)
   	      begin
			     if(x_cnt == 10'd799)
				    begin
		               if(col<29)
					        col <= col+1;  // col在纵坐标有效范围内从0-29循环计数
                        if(col==29)							
		                    col <= 0;
				    end
	          end
	
/****************************************************************************************/

always @(posedge clk_25m)
begin
	if(!rst_n)
		begin
			row<=0;
		end
	else		
		if ((x_dis >= 10'd0) && (x_dis < 10'd623)) 
			begin
				if(row<25)
					row<=row+1;  //row在横坐标有效范围内从0-25循环计数
				else
					if(row==25)		
						row<=0;
			end
		else
			if(x_dis == 10'd623)
				row<=0;
end
	
/****************************************************************************************/

always @(posedge clk_25m)
begin
	if(x_cnt == 10'd799)
		begin
		  if(col==29)  
			  begin
				  if(c<15)
					 c<=c+1;
				  else
					 c<=0;
				end		
		end		
end
	  
/****************************************************************************************/	

always @(posedge clk_25m)
	  begin
			case(c)
			4'h0 : char_line <= char_line0;
			4'h1 : char_line <= char_line1;
			4'h2 : char_line <= char_line2;
			4'h3 : char_line <= char_line3;
			4'h4 : char_line <= char_line4;
			4'h5 : char_line <= char_line5;
			4'h6 : char_line <= char_line6;
			4'h7 : char_line <= char_line7;
			4'h8 : char_line <= char_line8;
			4'h9 : char_line <= char_line9;
			4'ha : char_line <= char_linea;
			4'hb : char_line <= char_lineb;
			4'hc : char_line <= char_linec;
			4'hd : char_line <= char_lined;
			4'he : char_line <= char_linee; 
			4'hf : char_line <= char_linef;			
			default : char_line <= char_line0;
			endcase
	  end
	  
/****************************************************************************************/	

always @(posedge clk_25m or negedge rst_n)
begin	   
	if(!rst_n)
		begin
			 r<=23;
		end
	else
		if(row==25)
			begin
				if(r!=0)
					 r<=r-1;
				else
					 r<=23;
			end
end
		
/****************************************************************************************/

always @(posedge clk_25m or negedge rst_n)
begin
	if(!rst_n)
		begin
			D<=0;
		end
	else
		D<=char_line[r];
end
		
/****************************************************************************************/	
	
always @(posedge clk_25m )
begin
	if(!valid)
		vga_rgb <= 8'b00;	
	else
		if(D==1)   
			//vga_rgb <= 8'b111_000_00;	//红色
			vga_rgb <= 8'b111_111_11;	//白色
	else      
		if(D==0)
			//vga_rgb <= 8'b000_111_00;	//绿色
			vga_rgb <= 8'b000_000_00;	//黑色
		else
			vga_rgb <= 8'b00;	
end

/****************************************************************************************/

//r,g,b控制液晶屏颜色显示
assign vga_r = vga_rgb[7:5];
assign vga_g = vga_rgb[4:2];
assign vga_b = vga_rgb[1:0];

endmodule
