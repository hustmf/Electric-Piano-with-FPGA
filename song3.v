`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:48:17 05/31/2017 
// Design Name: 
// Module Name:    song3 
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
module song3(clk,ifplay,SongData);	
input ifplay;
input clk;
output [4:0]SongData;
reg [7:0]state;
initial state=0;
reg[4:0]YinFu;
assign SongData=YinFu;
always @(posedge clk)
begin
   state = state + 1'b1;	
	if(!ifplay)begin state=0;end
   if(state>196) begin state = 1;end//计时，以实现循环演奏
	case(state)
		1,2,3,4,5,6:YinFu=21;
		7,8:YinFu=12;
		
		9,10,11:YinFu=11;
		12:YinFu=9;
		13,14:YinFu=9;
		15,16:YinFu=7;
		
		17,18,19:YinFu=8;
		20:YinFu=7;
		21,22:YinFu=8;
		23,24:YinFu=12;
		
		25,26,27:YinFu=11;
		28:YinFu=9;
		29,30:YinFu=9;
		31,32:YinFu=11;
		
		33,34,35,36,37,38:YinFu=12;
		39,40:YinFu=14;
		
		41,42,43:YinFu=11;
		44:YinFu=9;
		45,46:YinFu=9;
		47,48:YinFu=7;
		
		49,50,51:YinFu=8;
		52:YinFu=7;
		53,54:YinFu=8;
		55,56:YinFu=9;
		
		57,58,59:YinFu=7;
		60:YinFu=5;
		61,62:YinFu=5;
		63,64:YinFu=4;
		
		65,66,67:YinFu=7;
		68,69:YinFu=4;
		
		70,71,72,73,74,75:YinFu=6;
		76,77:YinFu=9;
		
		78,79,80:YinFu=8;
		81:YinFu=7;
		82,83:YinFu=8;
		84,85:YinFu=9;
		
		86,87,88:YinFu=7;
		89:YinFu=7;
		90,91:YinFu=9;
		92,93:YinFu=11;
		
		94,95,96,97,98,99:YinFu=12;
		100:YinFu=21;
		101,102:YinFu=12;
		
		103,104,105:YinFu=11;
		106,107,108:YinFu=9;
		109,110:YinFu=7;
		
		111,112,113:YinFu=8;
		114:YinFu=7;
		115,116:YinFu=8;
		117,118:YinFu=9;
		
		119,120,121:YinFu=7;
		122,123,124:YinFu=5;
		125,126:YinFu=4;
		
		127,128,129,130,131,132:YinFu=7;
		133,134:YinFu=12;
		
		135,136,137:YinFu=11;
		138,139,140:YinFu=9;
		141,142:YinFu=7;
		
		143,144,145:YinFu=8;
		146:YinFu=7;
		147,148:YinFu=8;
		149,150:YinFu=12;
		
		151,152,153:YinFu=11;
		154,155,156:YinFu=9;
		157,158:YinFu=11;
		
		159,160,161,162,163,164:YinFu=12;
		165,166:YinFu=14;
		
		167,168,169:YinFu=11;
		170,171,172:YinFu=9;
		173,174:YinFu=7;
		
		175,176,177:YinFu=8;
		178:YinFu=7;
		179,180:YinFu=8;
		181,182:YinFu=9;
		
		183,184,185:YinFu=7;
		186,187,188:YinFu=5;
		189,190:YinFu=4;
		
		191,192,193,194,195,196:YinFu=7;
		
		
		
	
	default:YinFu=5'b10101;
	endcase
end


endmodule

