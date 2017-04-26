module seven_segment_disp_two(in,out);
input [3:0]in;
output [6:0]out;
reg [6:0]out;
always@(in)
case(in)
	4'h0:out=~7'h3F;
	4'h1:out=~7'h3F;
	4'h2:out=~7'h3F;
	4'h3:out=~7'h3F;
	4'h4:out=~7'h3F;
	4'h5:out=~7'h3F;
	4'h6:out=~7'h3F;
	4'h7:out=~7'h3F;
	4'h8:out=~7'h3F;
	4'h9:out=~7'h3F;
	4'ha:out=~7'h06;
	4'hb:out=~7'h06;
	4'hc:out=~7'h06;
	4'hd:out=~7'h06;
	4'he:out=~7'h06;
	4'hf:out=~7'h06;
endcase
endmodule