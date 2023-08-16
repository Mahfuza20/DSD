module halfAdder(c,s,a,b);
input a,b;
output c,s;

xor(s,a,b);
and(c,a,b);

endmodule


module fullAdder(cout,sum,a,b,cin);
input a,b,cin;
output cout,sum;

wire s,c,c1;

halfAdder hf1(c,s,a,b);
halfAdder hf2(c1,sum,s,cin);
or(cout,c,c1);

endmodule

module multiBitAdder(cout,sum,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire c1,c2,c3;



fullAdder fa1(c1,sum[0],a[0],b[0],cin);
fullAdder fa2(c2,sum[1],a[1],b[1],c1);
fullAdder fa3(c3,sum[2],a[2],b[2],c2);
fullAdder fa4(cout,sum[3],a[3],b[3],c3);

endmodule

/*
module multiBitAddertest;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;

multiBitAdder fa(sum,cout,a,b,cin);

initial
begin

     cin=0; a=4'b 1010; b=4'b 1011;
#100 cin=0; a=4'b 1110; b=4'b 1111;

end
endmodule
*/
/*
module multiBitAdderSubtractor(cout,sum,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]t;

xor(t[0],b[0],cin);
xor(t[1],b[1],cin);
xor(t[2],b[2],cin);
xor(t[3],b[3],cin);

multiBitAdder sb(cout,sum,a,t,cin);
endmodule
*/
/*
module multiBitAdderSubtractortest;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
multiBitAdderSubtractor mab(cout,sum,a,b,cin);
initial
begin
     cin=1; a=4'b 1010; b=4'b 1011;
#100 cin=1; a=4'b 1110; b=4'b 1111;

end
endmodule
*/
/*
module four_Bit_adderSubtractor(cout,sum,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]t;
wire c1,c2,c3;
xor(t[0],b[0],cin);
xor(t[1],b[1],cin);
xor(t[2],b[2],cin);
xor(t[3],b[3],cin);

fullAdder fa1(c1,sum[0],a[0],t[0],cin);
fullAdder fa2(c2,sum[1],a[1],t[1],c1);
fullAdder fa3(c3,sum[2],a[2],t[2],c2);
fullAdder fa4(cout,sum[3],a[3],t[3],c3);
endmodule
module four_Bit_adderSubtractortest;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
four_Bit_adderSubtractor fas(cout,sum,a,b,cin);
initial
begin
     cin=0; a=4'b 1010; b=4'b 1011;
#100 cin=0; a=4'b 1110; b=4'b 1111;

end
endmodule
*/

module bcdAdder(cout,sum,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;
wire [3:0]s;
wire c1,cx;
multiBitAdder ma1(c1,s,a,b,cin);
wire c2,c3,c4;
and(c2,s[3],s[2]);
and(c3,s[3],s[1]);
or(c4,c2,c3);
or(cout,c1,c4);
wire [3:0]d;
assign d[0]=0;
assign d[3]=0;
assign d[1]=cout;
assign d[2]=cout;
multiBitAdder ma2(cx,sum,d,s,d[0]);
endmodule
module bcdAddertest;
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire cout;
bcdAdder ba(cout,sum,a,b,cin);
initial
begin
     cin=0; a=4'b 0110; b=4'b 0110;
#100 cin=0; a=4'b 1000; b=4'b 0101;
end
endmodule
