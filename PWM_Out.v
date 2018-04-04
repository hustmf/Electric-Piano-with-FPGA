`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:49 05/29/2017 
// Design Name: 
// Module Name:    PWM_Out 
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
module PWM_Out(musicdata,CP,PWM_Out
    );
input[7:0]musicdata;
input CP;
output reg PWM_Out;
reg [7:0]counter;
initial
begin
counter=0;
end
always@(posedge CP)
 begin
   counter<=counter+1;
	if(musicdata>counter)
	begin 
	  PWM_Out<=0;
	end
	else
	begin
	  PWM_Out<=1;
	end
 end

endmodule
