`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:41:20 06/30/2013 
// Design Name: 
// Module Name:    DD 
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
module DD(
           DCLK, 
			  D, 
			  Q
			);
    input    DCLK;
    input    D;
    output   Q;
	 reg    Q;
	  
	 always @(posedge DCLK)
		begin
			Q<=D;
		end	
endmodule
