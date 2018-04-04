`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:44:38 06/29/2013 
// Design Name: 
// Module Name:    frq 
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
module frq(clk, rst_n, clk_25m);

input clk;
input rst_n;
output clk_25m;

reg cnt;
reg clk_25m;

always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			cnt <= 1'b0;
			clk_25m <= 1'b0;
		end
	else if(cnt < 1'd0)
		cnt <= cnt + 1'b1;
	else
		begin
		cnt <= 1'b0;
		clk_25m <= ~clk_25m;
		end
end

endmodule
