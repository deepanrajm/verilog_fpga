module fa (a,b,c,sum,cout);
input a,b,c;
output sum,cout;
wire s1,c1,c2;
ha ha1 (a,b,c1,s1);
ha ha2 (c, s1,c2,sum);
or or1 (cout,c1,c2);
endmodule 