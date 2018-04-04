`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:51 05/29/2017 
// Design Name: 
// Module Name:    sin 
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
module sin(CP,YinDiao,YinFu,musicdata);
input CP;
wire CP0; 
wire CP1;
input[2:0]YinDiao;
input[4:0]YinFu;
output reg[7:0]musicdata;
wire nCLR=1;
Divider F0(.CLK(CP),.nCLR(nCLR),.CLK_Out(CP0));
defparam
    F0.Out_Freq=100;
Divider F1(.CLK(CP),.nCLR(nCLR),.CLK_Out(CP1));
defparam
    F1.Out_Freq=44100;

parameter MEM_FILE_C_low1="./sin_data/C/SineTable-C-low1.dat";
parameter MEM_FILE_C_low2="./sin_data/C/SineTable-C-low2.dat";
parameter MEM_FILE_C_low3="./sin_data/C/SineTable-C-low3.dat";
parameter MEM_FILE_C_low4="./sin_data/C/SineTable-C-low4.dat";
parameter MEM_FILE_C_low5="./sin_data/C/SineTable-C-low5.dat";
parameter MEM_FILE_C_low6="./sin_data/C/SineTable-C-low6.dat";
parameter MEM_FILE_C_low7="./sin_data/C/SineTable-C-low7.dat";
reg signed[7:0]sinTable_C_low1[337:0];
reg signed[7:0]sinTable_C_low2[337:0];
reg signed[7:0]sinTable_C_low3[337:0];
reg signed[7:0]sinTable_C_low4[337:0];
reg signed[7:0]sinTable_C_low5[337:0];
reg signed[7:0]sinTable_C_low6[337:0];
reg signed[7:0]sinTable_C_low7[337:0];
initial
begin
$readmemh(MEM_FILE_C_low1,sinTable_C_low1);
$readmemh(MEM_FILE_C_low2,sinTable_C_low2);
$readmemh(MEM_FILE_C_low3,sinTable_C_low3);
$readmemh(MEM_FILE_C_low4,sinTable_C_low4);
$readmemh(MEM_FILE_C_low5,sinTable_C_low5);
$readmemh(MEM_FILE_C_low6,sinTable_C_low6);
$readmemh(MEM_FILE_C_low7,sinTable_C_low7);
end


parameter MEM_FILE_D_low1="./sin_data/D/SineTable-D-low1.dat";
parameter MEM_FILE_D_low2="./sin_data/D/SineTable-D-low2.dat";
parameter MEM_FILE_D_low3="./sin_data/D/SineTable-D-low3.dat";
parameter MEM_FILE_D_low4="./sin_data/D/SineTable-D-low4.dat";
parameter MEM_FILE_D_low5="./sin_data/D/SineTable-D-low5.dat";
parameter MEM_FILE_D_low6="./sin_data/D/SineTable-D-low6.dat";
parameter MEM_FILE_D_low7="./sin_data/D/SineTable-D-low7.dat";
reg signed[7:0]sinTable_D_low1[337:0];
reg signed[7:0]sinTable_D_low2[337:0];
reg signed[7:0]sinTable_D_low3[337:0];
reg signed[7:0]sinTable_D_low4[337:0];
reg signed[7:0]sinTable_D_low5[337:0];
reg signed[7:0]sinTable_D_low6[337:0];
reg signed[7:0]sinTable_D_low7[337:0];
initial
begin
$readmemh(MEM_FILE_D_low1,sinTable_D_low1);
$readmemh(MEM_FILE_D_low2,sinTable_D_low2);
$readmemh(MEM_FILE_D_low3,sinTable_D_low3);
$readmemh(MEM_FILE_D_low4,sinTable_D_low4);
$readmemh(MEM_FILE_D_low5,sinTable_D_low5);
$readmemh(MEM_FILE_D_low6,sinTable_D_low6);
$readmemh(MEM_FILE_D_low7,sinTable_D_low7);
end
parameter MEM_FILE_E_low1="./sin_data/E/SineTable-E-low1.dat";
parameter MEM_FILE_E_low2="./sin_data/E/SineTable-E-low2.dat";
parameter MEM_FILE_E_low3="./sin_data/E/SineTable-E-low3.dat";
parameter MEM_FILE_E_low4="./sin_data/E/SineTable-E-low4.dat";
parameter MEM_FILE_E_low5="./sin_data/E/SineTable-E-low5.dat";
parameter MEM_FILE_E_low6="./sin_data/E/SineTable-E-low6.dat";
parameter MEM_FILE_E_low7="./sin_data/E/SineTable-E-low7.dat";
reg signed[7:0]sinTable_E_low1[337:0];
reg signed[7:0]sinTable_E_low2[337:0];
reg signed[7:0]sinTable_E_low3[337:0];
reg signed[7:0]sinTable_E_low4[337:0];
reg signed[7:0]sinTable_E_low5[337:0];
reg signed[7:0]sinTable_E_low6[337:0];
reg signed[7:0]sinTable_E_low7[337:0];
initial
begin
$readmemh(MEM_FILE_E_low1,sinTable_E_low1);
$readmemh(MEM_FILE_E_low2,sinTable_E_low2);
$readmemh(MEM_FILE_E_low3,sinTable_E_low3);
$readmemh(MEM_FILE_E_low4,sinTable_E_low4);
$readmemh(MEM_FILE_E_low5,sinTable_E_low5);
$readmemh(MEM_FILE_E_low6,sinTable_E_low6);
$readmemh(MEM_FILE_E_low7,sinTable_E_low7);
end

parameter MEM_FILE_F_low1="./sin_data/F/SineTable-F-low1.dat";
parameter MEM_FILE_F_low2="./sin_data/F/SineTable-F-low2.dat";
parameter MEM_FILE_F_low3="./sin_data/F/SineTable-F-low3.dat";
parameter MEM_FILE_F_low4="./sin_data/F/SineTable-F-low4.dat";
parameter MEM_FILE_F_low5="./sin_data/F/SineTable-F-low5.dat";
parameter MEM_FILE_F_low6="./sin_data/F/SineTable-F-low6.dat";
parameter MEM_FILE_F_low7="./sin_data/F/SineTable-F-low7.dat";
reg signed[7:0]sinTable_F_low1[337:0];
reg signed[7:0]sinTable_F_low2[337:0];
reg signed[7:0]sinTable_F_low3[337:0];
reg signed[7:0]sinTable_F_low4[337:0];
reg signed[7:0]sinTable_F_low5[337:0];
reg signed[7:0]sinTable_F_low6[337:0];
reg signed[7:0]sinTable_F_low7[337:0];
initial
begin
$readmemh(MEM_FILE_F_low1,sinTable_F_low1);
$readmemh(MEM_FILE_F_low2,sinTable_F_low2);
$readmemh(MEM_FILE_F_low3,sinTable_F_low3);
$readmemh(MEM_FILE_F_low4,sinTable_F_low4);
$readmemh(MEM_FILE_F_low5,sinTable_F_low5);
$readmemh(MEM_FILE_F_low6,sinTable_F_low6);
$readmemh(MEM_FILE_F_low7,sinTable_F_low7);
end

parameter MEM_FILE_G_low1="./sin_data/G/SineTable-G-low1.dat";
parameter MEM_FILE_G_low2="./sin_data/G/SineTable-G-low2.dat";
parameter MEM_FILE_G_low3="./sin_data/G/SineTable-G-low3.dat";
parameter MEM_FILE_G_low4="./sin_data/G/SineTable-G-low4.dat";
parameter MEM_FILE_G_low5="./sin_data/G/SineTable-G-low5.dat";
parameter MEM_FILE_G_low6="./sin_data/G/SineTable-G-low6.dat";
parameter MEM_FILE_G_low7="./sin_data/G/SineTable-G-low7.dat";
reg signed[7:0]sinTable_G_low1[337:0];
reg signed[7:0]sinTable_G_low2[337:0];
reg signed[7:0]sinTable_G_low3[337:0];
reg signed[7:0]sinTable_G_low4[337:0];
reg signed[7:0]sinTable_G_low5[337:0];
reg signed[7:0]sinTable_G_low6[337:0];
reg signed[7:0]sinTable_G_low7[337:0];
initial
begin
$readmemh(MEM_FILE_G_low1,sinTable_G_low1);
$readmemh(MEM_FILE_G_low2,sinTable_G_low2);
$readmemh(MEM_FILE_G_low3,sinTable_G_low3);
$readmemh(MEM_FILE_G_low4,sinTable_G_low4);
$readmemh(MEM_FILE_G_low5,sinTable_G_low5);
$readmemh(MEM_FILE_G_low6,sinTable_G_low6);
$readmemh(MEM_FILE_G_low7,sinTable_G_low7);
end

parameter MEM_FILE_A_low1="./sin_data/A/SineTable-A-low1.dat";
parameter MEM_FILE_A_low2="./sin_data/A/SineTable-A-low2.dat";
parameter MEM_FILE_A_low3="./sin_data/A/SineTable-A-low3.dat";
parameter MEM_FILE_A_low4="./sin_data/A/SineTable-A-low4.dat";
parameter MEM_FILE_A_low5="./sin_data/A/SineTable-A-low5.dat";
parameter MEM_FILE_A_low6="./sin_data/A/SineTable-A-low6.dat";
parameter MEM_FILE_A_low7="./sin_data/A/SineTable-A-low7.dat";
reg signed[7:0]sinTable_A_low1[337:0];
reg signed[7:0]sinTable_A_low2[337:0];
reg signed[7:0]sinTable_A_low3[337:0];
reg signed[7:0]sinTable_A_low4[337:0];
reg signed[7:0]sinTable_A_low5[337:0];
reg signed[7:0]sinTable_A_low6[337:0];
reg signed[7:0]sinTable_A_low7[337:0];
initial
begin
$readmemh(MEM_FILE_A_low1,sinTable_A_low1);
$readmemh(MEM_FILE_A_low2,sinTable_A_low2);
$readmemh(MEM_FILE_A_low3,sinTable_A_low3);
$readmemh(MEM_FILE_A_low4,sinTable_A_low4);
$readmemh(MEM_FILE_A_low5,sinTable_A_low5);
$readmemh(MEM_FILE_A_low6,sinTable_A_low6);
$readmemh(MEM_FILE_A_low7,sinTable_A_low7);
end


parameter MEM_FILE_B_low1="./sin_data/B/SineTable-B-low1.dat";
parameter MEM_FILE_B_low2="./sin_data/B/SineTable-B-low2.dat";
parameter MEM_FILE_B_low3="./sin_data/B/SineTable-B-low3.dat";
parameter MEM_FILE_B_low4="./sin_data/B/SineTable-B-low4.dat";
parameter MEM_FILE_B_low5="./sin_data/B/SineTable-B-low5.dat";
parameter MEM_FILE_B_low6="./sin_data/B/SineTable-B-low6.dat";
parameter MEM_FILE_B_low7="./sin_data/B/SineTable-B-low7.dat";
reg signed[7:0]sinTable_B_low1[337:0];
reg signed[7:0]sinTable_B_low2[337:0];
reg signed[7:0]sinTable_B_low3[337:0];
reg signed[7:0]sinTable_B_low4[337:0];
reg signed[7:0]sinTable_B_low5[337:0];
reg signed[7:0]sinTable_B_low6[337:0];
reg signed[7:0]sinTable_B_low7[337:0];
initial
begin
$readmemh(MEM_FILE_B_low1,sinTable_B_low1);
$readmemh(MEM_FILE_B_low2,sinTable_B_low2);
$readmemh(MEM_FILE_B_low3,sinTable_B_low3);
$readmemh(MEM_FILE_B_low4,sinTable_B_low4);
$readmemh(MEM_FILE_B_low5,sinTable_B_low5);
$readmemh(MEM_FILE_B_low6,sinTable_B_low6);
$readmemh(MEM_FILE_B_low7,sinTable_B_low7);
end

reg signed[7:0]sinTable[337:0];
reg[8:0]addr;
reg[2:0]addr_step;
reg[8:0]addr_length;
initial
begin
addr=0;
end
  always@(posedge CP0)
  begin
    case(YinDiao)
      3'b000:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=336;end
			  5'b00001:begin addr_step=1;addr_length=300;end
			  5'b00010:begin addr_step=1;addr_length=267;end
			  5'b00011:begin addr_step=1;addr_length=252;end
			  5'b00100:begin addr_step=1;addr_length=225;end
			  5'b00101:begin addr_step=1;addr_length=200;end
			  5'b00110:begin addr_step=1;addr_length=189;end
			  5'b00111:begin addr_step=2'b10;addr_length=336;end
			  5'b01000:begin addr_step=2'b10;addr_length=300;end
			  5'b01001:begin addr_step=2'b10;addr_length=267;end
			  5'b01010:begin addr_step=2'b10;addr_length=252;end
			  5'b01011:begin addr_step=2'b10;addr_length=225;end
			  5'b01100:begin addr_step=2'b10;addr_length=220;end
			  5'b01101:begin addr_step=2'b10;addr_length=189;end
			  5'b01110:begin addr_step=3'b100;addr_length=336;end
			  5'b01111:begin addr_step=3'b100;addr_length=300;end
			  5'b10000:begin addr_step=3'b100;addr_length=267;end
			  5'b10001:begin addr_step=3'b100;addr_length=252;end
			  5'b10010:begin addr_step=3'b100;addr_length=225;end
			  5'b10011:begin addr_step=3'b100;addr_length=200;end
			  5'b10100:begin addr_step=3'b100;addr_length=189;end
			endcase
		end
	   3'b001:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=300;end
			  5'b00001:begin addr_step=1;addr_length=267;end
			  5'b00010:begin addr_step=1;addr_length=238;end
			  5'b00011:begin addr_step=1;addr_length=225;end
			  5'b00100:begin addr_step=1;addr_length=200;end
			  5'b00101:begin addr_step=1;addr_length=179;end
			  5'b00110:begin addr_step=1;addr_length=168;end
			  5'b00111:begin addr_step=2'b10;addr_length=300;end
			  5'b01000:begin addr_step=2'b10;addr_length=267;end
			  5'b01001:begin addr_step=2'b10;addr_length=238;end
			  5'b01010:begin addr_step=2'b10;addr_length=225;end
			  5'b01011:begin addr_step=2'b10;addr_length=200;end
			  5'b01100:begin addr_step=2'b10;addr_length=179;end
			  5'b01101:begin addr_step=2'b10;addr_length=168;end
			  5'b01110:begin addr_step=3'b100;addr_length=300;end
			  5'b01111:begin addr_step=3'b100;addr_length=267;end
			  5'b10000:begin addr_step=3'b100;addr_length=238;end
			  5'b10001:begin addr_step=3'b100;addr_length=225;end
			  5'b10010:begin addr_step=3'b100;addr_length=200;end
			  5'b10011:begin addr_step=3'b100;addr_length=179;end
			  5'b10100:begin addr_step=3'b100;addr_length=168;end
			endcase
		end
	   3'b010:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=267;end
			  5'b00001:begin addr_step=1;addr_length=238;end
			  5'b00010:begin addr_step=1;addr_length=213;end
			  5'b00011:begin addr_step=1;addr_length=200;end
			  5'b00100:begin addr_step=1;addr_length=179;end
			  5'b00101:begin addr_step=1;addr_length=159;end
			  5'b00110:begin addr_step=1;addr_length=150;end
			  5'b00111:begin addr_step=2'b10;addr_length=267;end
			  5'b01000:begin addr_step=2'b10;addr_length=238;end
			  5'b01001:begin addr_step=2'b10;addr_length=213;end
			  5'b01010:begin addr_step=2'b10;addr_length=200;end
			  5'b01011:begin addr_step=2'b10;addr_length=179;end
			  5'b01100:begin addr_step=2'b10;addr_length=159;end
			  5'b01101:begin addr_step=2'b10;addr_length=150;end
			  5'b01110:begin addr_step=3'b100;addr_length=267;end
			  5'b01111:begin addr_step=3'b100;addr_length=238;end
			  5'b10000:begin addr_step=3'b100;addr_length=213;end
			  5'b10001:begin addr_step=3'b100;addr_length=200;end
			  5'b10010:begin addr_step=3'b100;addr_length=179;end
			  5'b10011:begin addr_step=3'b100;addr_length=159;end
			  5'b10100:begin addr_step=3'b100;addr_length=150;end
			endcase
	end	  
	   3'b011:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=253;end
			  5'b00001:begin addr_step=1;addr_length=225;end
			  5'b00010:begin addr_step=1;addr_length=200;end
			  5'b00011:begin addr_step=1;addr_length=189;end
			  5'b00100:begin addr_step=1;addr_length=168;end
			  5'b00101:begin addr_step=1;addr_length=150;end
			  5'b00110:begin addr_step=1;addr_length=141;end
			  5'b00111:begin addr_step=2'b10;addr_length=253;end
			  5'b01000:begin addr_step=2'b10;addr_length=225;end
			  5'b01001:begin addr_step=2'b10;addr_length=200;end
			  5'b01010:begin addr_step=2'b10;addr_length=189;end
			  5'b01011:begin addr_step=2'b10;addr_length=168;end
			  5'b01100:begin addr_step=2'b10;addr_length=150;end
			  5'b01101:begin addr_step=2'b10;addr_length=141;end
			  5'b01110:begin addr_step=3'b100;addr_length=253;end
			  5'b01111:begin addr_step=3'b100;addr_length=225;end
			  5'b10000:begin addr_step=3'b100;addr_length=200;end
			  5'b10001:begin addr_step=3'b100;addr_length=189;end
			  5'b10010:begin addr_step=3'b100;addr_length=168;end
			  5'b10011:begin addr_step=3'b100;addr_length=150;end
			  5'b10100:begin addr_step=3'b100;addr_length=141;end
			endcase
		end  
	   3'b100:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=225;end
			  5'b00001:begin addr_step=1;addr_length=200;end
			  5'b00010:begin addr_step=1;addr_length=194;end
			  5'b00011:begin addr_step=1;addr_length=168;end
			  5'b00100:begin addr_step=1;addr_length=150;end
			  5'b00101:begin addr_step=1;addr_length=134;end
			  5'b00110:begin addr_step=1;addr_length=126;end
			  5'b00111:begin addr_step=2'b10;addr_length=225;end
			  5'b01000:begin addr_step=2'b10;addr_length=200;end
			  5'b01001:begin addr_step=2'b10;addr_length=194;end
			  5'b01010:begin addr_step=2'b10;addr_length=168;end
			  5'b01011:begin addr_step=2'b10;addr_length=150;end
			  5'b01100:begin addr_step=2'b10;addr_length=134;end
			  5'b01101:begin addr_step=2'b10;addr_length=126;end
			  5'b01110:begin addr_step=3'b100;addr_length=225;end
			  5'b01111:begin addr_step=3'b100;addr_length=200;end
			  5'b10000:begin addr_step=3'b100;addr_length=194;end
			  5'b10001:begin addr_step=3'b100;addr_length=168;end
			  5'b10010:begin addr_step=3'b100;addr_length=150;end
			  5'b10011:begin addr_step=3'b100;addr_length=134;end
			  5'b10100:begin addr_step=3'b100;addr_length=126;end
			endcase
		end  
	   3'b101:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=200;end
			  5'b00001:begin addr_step=1;addr_length=178;end
			  5'b00010:begin addr_step=1;addr_length=159;end
			  5'b00011:begin addr_step=1;addr_length=150;end
			  5'b00100:begin addr_step=1;addr_length=134;end
			  5'b00101:begin addr_step=1;addr_length=121;end
			  5'b00110:begin addr_step=1;addr_length=111;end
			  5'b00111:begin addr_step=2'b10;addr_length=200;end
			  5'b01000:begin addr_step=2'b10;addr_length=178;end
			  5'b01001:begin addr_step=2'b10;addr_length=159;end
			  5'b01010:begin addr_step=2'b10;addr_length=150;end
			  5'b01011:begin addr_step=2'b10;addr_length=134;end
			  5'b01100:begin addr_step=2'b10;addr_length=121;end
			  5'b01101:begin addr_step=2'b10;addr_length=111;end
			  5'b01110:begin addr_step=3'b100;addr_length=200;end
			  5'b01111:begin addr_step=3'b100;addr_length=178;end
			  5'b10000:begin addr_step=3'b100;addr_length=159;end
			  5'b10001:begin addr_step=3'b100;addr_length=150;end
			  5'b10010:begin addr_step=3'b100;addr_length=134;end
			  5'b10011:begin addr_step=3'b100;addr_length=121;end
			  5'b10100:begin addr_step=3'b100;addr_length=111;end
			endcase
		end
	   3'b110:
		begin
		   case(YinFu)
			  5'b00000:begin addr_step=1;addr_length=178;end
			  5'b00001:begin addr_step=1;addr_length=159;end
			  5'b00010:begin addr_step=1;addr_length=142;end
			  5'b00011:begin addr_step=1;addr_length=133;end
			  5'b00100:begin addr_step=1;addr_length=119;end
			  5'b00101:begin addr_step=1;addr_length=106;end
			  5'b00110:begin addr_step=1;addr_length=100;end
			  5'b00111:begin addr_step=2'b10;addr_length=178;end
			  5'b01000:begin addr_step=2'b10;addr_length=159;end
			  5'b01001:begin addr_step=2'b10;addr_length=142;end
			  5'b01010:begin addr_step=2'b10;addr_length=133;end
			  5'b01011:begin addr_step=2'b10;addr_length=119;end
			  5'b01100:begin addr_step=2'b10;addr_length=106;end
			  5'b01101:begin addr_step=2'b10;addr_length=100;end
			  5'b01110:begin addr_step=3'b100;addr_length=178;end
			  5'b01111:begin addr_step=3'b100;addr_length=159;end
			  5'b10000:begin addr_step=3'b100;addr_length=142;end
			  5'b10001:begin addr_step=3'b100;addr_length=133;end
			  5'b10010:begin addr_step=3'b100;addr_length=119;end
			  5'b10011:begin addr_step=3'b100;addr_length=106;end
			  5'b10100:begin addr_step=3'b100;addr_length=100;end
			endcase
		end
	  endcase
  end
  
  always@(posedge CP1)
  begin
    addr<=addr+addr_step;
	 if(addr>(addr_length))
	 begin
	   addr<=1;
	 end
	 case(YinDiao)
	 	   3'b000:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_C_low1[addr];end
			  5'b00001:begin musicdata=sinTable_C_low2[addr];end
           5'b00010:begin musicdata=sinTable_C_low3[addr];end
           5'b00011:begin musicdata=sinTable_C_low4[addr];end
			  5'b00100:begin musicdata=sinTable_C_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_C_low6[addr];end
			  5'b00110:begin musicdata=sinTable_C_low7[addr];end
			  5'b00111:begin musicdata=sinTable_C_low1[addr];end
			  5'b01000:begin musicdata=sinTable_C_low2[addr];end
			  5'b01001:begin musicdata=sinTable_C_low3[addr];end
			  5'b01010:begin musicdata=sinTable_C_low4[addr];end
			  5'b01011:begin musicdata=sinTable_C_low5[addr];end
			  5'b01100:begin musicdata=sinTable_C_low6[addr];end
			  5'b01101:begin musicdata=sinTable_C_low7[addr];end
			  5'b01110:begin musicdata=sinTable_C_low1[addr];end
			  5'b01111:begin musicdata=sinTable_C_low2[addr];end
			  5'b10000:begin musicdata=sinTable_C_low3[addr];end
			  5'b10001:begin musicdata=sinTable_C_low4[addr];end
			  5'b10010:begin musicdata=sinTable_C_low5[addr];end
			  5'b10011:begin musicdata=sinTable_C_low6[addr];end
			  5'b10100:begin musicdata=sinTable_C_low7[addr];end
			  5'b10101:begin musicdata=0;end
			endcase
		end
	   3'b001:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_D_low1[addr];end
			  5'b00001:begin musicdata=sinTable_D_low2[addr];end
           5'b00010:begin musicdata=sinTable_D_low3[addr];end
           5'b00011:begin musicdata=sinTable_D_low4[addr];end
			  5'b00100:begin musicdata=sinTable_D_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_D_low6[addr];end
			  5'b00110:begin musicdata=sinTable_D_low7[addr];end
			  5'b00111:begin musicdata=sinTable_D_low1[addr];end
			  5'b01000:begin musicdata=sinTable_D_low2[addr];end
			  5'b01001:begin musicdata=sinTable_D_low3[addr];end
			  5'b01010:begin musicdata=sinTable_D_low4[addr];end
			  5'b01011:begin musicdata=sinTable_D_low5[addr];end
			  5'b01100:begin musicdata=sinTable_D_low6[addr];end
			  5'b01101:begin musicdata=sinTable_D_low7[addr];end
			  5'b01110:begin musicdata=sinTable_D_low1[addr];end
			  5'b01111:begin musicdata=sinTable_D_low2[addr];end
			  5'b10000:begin musicdata=sinTable_D_low3[addr];end
			  5'b10001:begin musicdata=sinTable_D_low4[addr];end
			  5'b10010:begin musicdata=sinTable_D_low5[addr];end
			  5'b10011:begin musicdata=sinTable_D_low6[addr];end
			  5'b10100:begin musicdata=sinTable_D_low7[addr];end
			  5'b10101:begin musicdata=0;end
			endcase
		end
	   3'b010:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_E_low1[addr];end
			  5'b00001:begin musicdata=sinTable_E_low2[addr];end
           5'b00010:begin musicdata=sinTable_E_low3[addr];end
           5'b00011:begin musicdata=sinTable_E_low4[addr];end
			  5'b00100:begin musicdata=sinTable_E_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_E_low6[addr];end
			  5'b00110:begin musicdata=sinTable_E_low7[addr];end
			  5'b00111:begin musicdata=sinTable_E_low1[addr];end
			  5'b01000:begin musicdata=sinTable_E_low2[addr];end
			  5'b01001:begin musicdata=sinTable_E_low3[addr];end
			  5'b01010:begin musicdata=sinTable_E_low4[addr];end
			  5'b01011:begin musicdata=sinTable_E_low5[addr];end
			  5'b01100:begin musicdata=sinTable_E_low6[addr];end
			  5'b01101:begin musicdata=sinTable_E_low7[addr];end
			  5'b01110:begin musicdata=sinTable_E_low1[addr];end
			  5'b01111:begin musicdata=sinTable_E_low2[addr];end
			  5'b10000:begin musicdata=sinTable_E_low3[addr];end
			  5'b10001:begin musicdata=sinTable_E_low4[addr];end
			  5'b10010:begin musicdata=sinTable_E_low5[addr];end
			  5'b10011:begin musicdata=sinTable_E_low6[addr];end
			  5'b10100:begin musicdata=sinTable_E_low7[addr];end
			 5'b10101:begin musicdata=0;end
			endcase
	end	  
	   3'b011:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_F_low1[addr];end
			  5'b00001:begin musicdata=sinTable_F_low2[addr];end
           5'b00010:begin musicdata=sinTable_F_low3[addr];end
           5'b00011:begin musicdata=sinTable_F_low4[addr];end
			  5'b00100:begin musicdata=sinTable_F_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_F_low6[addr];end
			  5'b00110:begin musicdata=sinTable_F_low7[addr];end
			  5'b00111:begin musicdata=sinTable_F_low1[addr];end
			  5'b01000:begin musicdata=sinTable_F_low2[addr];end
			  5'b01001:begin musicdata=sinTable_F_low3[addr];end
			  5'b01010:begin musicdata=sinTable_F_low4[addr];end
			  5'b01011:begin musicdata=sinTable_F_low5[addr];end
			  5'b01100:begin musicdata=sinTable_F_low6[addr];end
			  5'b01101:begin musicdata=sinTable_F_low7[addr];end
			  5'b01110:begin musicdata=sinTable_F_low1[addr];end
			  5'b01111:begin musicdata=sinTable_F_low2[addr];end
			  5'b10000:begin musicdata=sinTable_F_low3[addr];end
			  5'b10001:begin musicdata=sinTable_F_low4[addr];end
			  5'b10010:begin musicdata=sinTable_F_low5[addr];end
			  5'b10011:begin musicdata=sinTable_F_low6[addr];end
			  5'b10100:begin musicdata=sinTable_F_low7[addr];end
			 5'b10101:begin musicdata=0;end
			endcase
		end  
	   3'b100:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_G_low1[addr];end
			  5'b00001:begin musicdata=sinTable_G_low2[addr];end
           5'b00010:begin musicdata=sinTable_G_low3[addr];end
           5'b00011:begin musicdata=sinTable_G_low4[addr];end
			  5'b00100:begin musicdata=sinTable_G_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_G_low6[addr];end
			  5'b00110:begin musicdata=sinTable_G_low7[addr];end
			  5'b00111:begin musicdata=sinTable_G_low1[addr];end
			  5'b01000:begin musicdata=sinTable_G_low2[addr];end
			  5'b01001:begin musicdata=sinTable_G_low3[addr];end
			  5'b01010:begin musicdata=sinTable_G_low4[addr];end
			  5'b01011:begin musicdata=sinTable_G_low5[addr];end
			  5'b01100:begin musicdata=sinTable_G_low6[addr];end
			  5'b01101:begin musicdata=sinTable_G_low7[addr];end
			  5'b01110:begin musicdata=sinTable_G_low1[addr];end
			  5'b01111:begin musicdata=sinTable_G_low2[addr];end
			  5'b10000:begin musicdata=sinTable_G_low3[addr];end
			  5'b10001:begin musicdata=sinTable_G_low4[addr];end
			  5'b10010:begin musicdata=sinTable_G_low5[addr];end
			  5'b10011:begin musicdata=sinTable_G_low6[addr];end
			  5'b10100:begin musicdata=sinTable_G_low7[addr];end
			 5'b10101:begin musicdata=0;end
			endcase
		end  
	   3'b101:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_A_low1[addr];end
			  5'b00001:begin musicdata=sinTable_A_low2[addr];end
           5'b00010:begin musicdata=sinTable_A_low3[addr];end
           5'b00011:begin musicdata=sinTable_A_low4[addr];end
			  5'b00100:begin musicdata=sinTable_A_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_A_low6[addr];end
			  5'b00110:begin musicdata=sinTable_A_low7[addr];end
			  5'b00111:begin musicdata=sinTable_A_low1[addr];end
			  5'b01000:begin musicdata=sinTable_A_low2[addr];end
			  5'b01001:begin musicdata=sinTable_A_low3[addr];end
			  5'b01010:begin musicdata=sinTable_A_low4[addr];end
			  5'b01011:begin musicdata=sinTable_A_low5[addr];end
			  5'b01100:begin musicdata=sinTable_A_low6[addr];end
			  5'b01101:begin musicdata=sinTable_A_low7[addr];end
			  5'b01110:begin musicdata=sinTable_A_low1[addr];end
			  5'b01111:begin musicdata=sinTable_A_low2[addr];end
			  5'b10000:begin musicdata=sinTable_A_low3[addr];end
			  5'b10001:begin musicdata=sinTable_A_low4[addr];end
			  5'b10010:begin musicdata=sinTable_A_low5[addr];end
			  5'b10011:begin musicdata=sinTable_A_low6[addr];end
			  5'b10100:begin musicdata=sinTable_A_low7[addr];end
			 5'b10101:begin musicdata=0;end
			endcase
		end
	   3'b110:
		begin
		   case(YinFu)
			  5'b00000:begin musicdata=sinTable_B_low1[addr];end
			  5'b00001:begin musicdata=sinTable_B_low2[addr];end
           5'b00010:begin musicdata=sinTable_B_low3[addr];end
           5'b00011:begin musicdata=sinTable_B_low4[addr];end
			  5'b00100:begin musicdata=sinTable_B_low5[addr];end		  
			  5'b00101:begin musicdata=sinTable_B_low6[addr];end
			  5'b00110:begin musicdata=sinTable_B_low7[addr];end
			  5'b00111:begin musicdata=sinTable_B_low1[addr];end
			  5'b01000:begin musicdata=sinTable_B_low2[addr];end
			  5'b01001:begin musicdata=sinTable_B_low3[addr];end
			  5'b01010:begin musicdata=sinTable_B_low4[addr];end
			  5'b01011:begin musicdata=sinTable_B_low5[addr];end
			  5'b01100:begin musicdata=sinTable_B_low6[addr];end
			  5'b01101:begin musicdata=sinTable_B_low7[addr];end
			  5'b01110:begin musicdata=sinTable_B_low1[addr];end
			  5'b01111:begin musicdata=sinTable_B_low2[addr];end
			  5'b10000:begin musicdata=sinTable_B_low3[addr];end
			  5'b10001:begin musicdata=sinTable_B_low4[addr];end
			  5'b10010:begin musicdata=sinTable_B_low5[addr];end
			  5'b10011:begin musicdata=sinTable_B_low6[addr];end
			  5'b10100:begin musicdata=sinTable_B_low7[addr];end
			5'b10101:begin musicdata=0;end
			endcase
		end
	   
	  endcase
  end
  


endmodule

