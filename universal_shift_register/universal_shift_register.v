module universal_shift_register(clk,in,out,reset,control,inn);
input clk, reset,in;
input [3:0] inn;
input [1:0] control;
output [3:0] out;
reg [3:0] r_reg,r_next;
always @ (posedge clk or posedge reset)
	begin 
		if(reset)
			r_reg <=0;
		else 
			r_reg <= r_next;
	end
	always @ (*)
		begin
			if (control [0])
				r_next = {in,r_reg[3:1]};
			else if (control [1])
				r_next = {r_reg[2:0],in};
			else if (control[0]&control[1])
				r_next = inn;
			else 
				r_next=r_reg;
		end
		assign out=r_reg;
endmodule 