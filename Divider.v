`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:27:12 05/29/2017 
// Design Name: 
// Module Name:    Divider 
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
module Divider(CLK,nCLR,CLK_Out
    );
 parameter N=25;
 parameter CLK_Freq=100000000;
 parameter Out_Freq=1;
 input nCLR,CLK;
 output reg CLK_Out;
 reg[N-1:0] Count_DIV;
 
 always@(posedge CLK or negedge nCLR)
 begin
   if(!nCLR)
	  begin 
	    CLK_Out<=0; Count_DIV<=0; 
	  end
	else
	  begin 
	    if(Count_DIV<(CLK_Freq/(2*Out_Freq)-1))
	      Count_DIV<=Count_DIV+1'b1;
	    else 
	      begin
			  Count_DIV<=0;
			  CLK_Out<=~CLK_Out;
			end
		end
 end
 
endmodule
