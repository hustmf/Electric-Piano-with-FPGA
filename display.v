`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:07 06/27/2013 
// Design Name: 
// Module Name:    display 
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
module display(clk, origin, anodes, cathodes);

//input start, reset;
input clk;
input [13:0]origin;
output [3:0] anodes;
output [6:0] cathodes;

reg	[3:0]		anodes_r;
reg	[6:0] 	cathodes_r;
reg	[15:0]	count;

assign	anodes	=	anodes_r;
assign	cathodes	=	cathodes_r;

initial  anodes_r = 4'b1110;

//动态显示 数码管位选
always @ (posedge clk) 
begin	
	/*if(!reset)
		begin
		anodes_r	<=	4'b1110;
		count	<=	0;
		end
	else */if(count < 2500) 
		count	<=	count + 1'b1;
	else 
		begin
		anodes_r	<=	{anodes_r[2:0], anodes_r[3]};
		count	<=	0;
		end
end

//动态显示 数码管段选
always @ (posedge clk) 
begin
	/*if(!reset)
		cathodes_r	<= 7'b1111111;
	else*/ 
		case(anodes_r)
			4'b1110: begin
						case(origin)
							//0:	cathodes_r	<=	7'b1000000;//0
							6826, 11606, 13994:	cathodes_r	<=	7'b1111001;//1
							7871, 12126, 14255:	cathodes_r	<=	7'b0100100;//2
							8798, 12591, 14487:	cathodes_r	<=	7'b0110000;//3
							9224, 12804, 14593:	cathodes_r	<=	7'b0011001;//4
							10005, 13194, 14789:	cathodes_r	<=	7'b0010010;//5
							10701, 13524, 14963:	cathodes_r	<=	7'b0000010;//6
							11321, 13852, 15117:	cathodes_r	<=	7'b1111000;//7
							//8:	cathodes_r	<=	7'b0000000;//8
							//9:	cathodes_r	<=	7'b0010000;//9
							default: 	cathodes_r	<=	7'b1111111;
						endcase
						end
			
			4'b1101: cathodes_r	<=	7'b0111111;
			
			4'b1011:	cathodes_r	<=	7'b0111111;
						
			4'b0111:	begin
						case(origin)
							6826,7871,8798,9224,10005,10701,11321:   		cathodes_r	<=	7'b0001001;  //H
							11606,12126,12591,12804,13194,13524,13852:  	cathodes_r	<= 7'b0001000;  //M
							13994,14255,14487,14593,14789,14963,15117:   cathodes_r	<= 7'b1000111;  //L
							default: 	cathodes_r	<=	7'b1111111;
						endcase
						end
			default cathodes_r	<=	7'b1111111;
		endcase
end



endmodule
