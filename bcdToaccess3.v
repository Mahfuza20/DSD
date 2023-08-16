
module bcdToaccess3(e,b);
input [3:0]b;
output [3:0]e;

wire c, d;

or(c,b[0],b[1]);
and(d,b[2],c);
or(e[3],b[3],d);

xor(e[2],b[2],c);

xnor(e[1],b[0],b[1]);

not(e[0],b[0]);

endmodule

module bcdToaccess3test;

reg [3:0]b;
wire [3:0]e;

bcdToaccess3 eb(e,b);

initial
begin

b = 4'b 0000;
#100;
b = 4'b 0001;
#100;
b = 4'b 0010;
#100;
b = 4'b 0011;
#100;
b = 4'b 0100;
#100;
b = 4'b 0101;
#100;
b = 4'b 0110;
#100;
b = 4'b 0111;
#100;
b = 4'b 1000;
#100;
b = 4'b 1001;
#100;
b = 4'b 1010;
#100;
b = 4'b 1011;
#100;
b = 4'b 1100;
#100;
b = 4'b 1101;
#100;
b = 4'b 1110;
#100;
b = 4'b 1111;
#100;

end

endmodule