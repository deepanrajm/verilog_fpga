module t_flipflop(q,t,clk,clr,control);
input t,clk,clr,control;
output q;
reg q;
always @ (negedge (clk) or negedge (clr))
	begin
		if(clr == 0)
			q = 0;
		else if (t == 1)
			q = ~q;
		else
			q = q;
	end
endmodule 
