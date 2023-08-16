
module grayToBinary(b,g);
input [3:0]g;
output [3:0]b;
buf(b[3],g[3]);
xor(b[2],b[3],g[2]);
xor(b[1],b[2],g[1]);
xor(b[0],b[1],g[0]);
endmodule




module test;

reg [3:0]g;
wire [3:0]b;
grayToBinary bg(b,g);

initial
begin

g = 4'b 0000;
#50;
g = 4'b 0001;
#50;
g = 4'b 0010;
#50;
g = 4'b 0011;
#50;
g = 4'b 0100;
#50;
g = 4'b 0101;
#50;
g = 4'b 0110;
#50;
g = 4'b 0111;
#50;
g = 4'b 1000;
#50;
g = 4'b 1001;
#50;
g = 4'b 1010;
#50;
g = 4'b 1011;
#50;
g = 4'b 1100;
#50;
g = 4'b 1101;
#50;
g = 4'b 1110;
#50;
g = 4'b 1111;
#50;

end

endmodule

