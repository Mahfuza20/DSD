module binary_To_gray(g,b);
input [3:0]b;
output [3:0]g;

buf(g[3],b[3]);
xor(g[2],b[3],b[2]);
xor(g[1],b[2],b[1]);
xor(g[0],b[1],b[0]);

endmodule

module binary_To_graytest;

reg [3:0]b;
wire [3:0]g;

binary_To_gray btg(g,b);

initial
begin

b=4'b 0000;
#50 b=4'b 0001;
#50 b=4'b 0010;
#50 b=4'b 0011;
#50 b=4'b 0100;

end
endmodule