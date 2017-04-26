module ripple_carry_adder(a,b,cin,s,cout);
input [7:0]a,b;
input cin;
output cout;
output [7:0]s;
wire c1,c2,c3,c4,c5,c6,c7;
fa fa1 (a[0],b[0],cin,s[0],c1);
fa fa2 (a[1],b[1],c1,s[1],c2);

fa fa3 (a[2],b[2],c2,s[2],c3);
fa fa4 (a[3],b[3],c3,s[3],c4);
fa fa5 (a[4],b[4],c4,s[4],c5);
fa fa6 (a[5],b[5],c5,s[5],c6);
fa fa7 (a[6],b[6],c6,s[6],c7);
fa fa8 (a[7],b[7],c7,s[7],cout);

endmodule 