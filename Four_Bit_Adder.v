`include "Full_Adder.v"
module Four_Bit_Adder (a, b, cin, s, cout);

input [ 3 : 0 ] a, b;
input cin;
output [ 3 : 0 ] s;
output cout;
wire [ 3 : 0 ] c; 

Full_Adder FA0 (.a(a[0]), .b(b[0]), .cin(cin),   .s(s[0]), .cout(c[0]));
Full_Adder FA1 (.a(a[1]), .b(b[1]), .cin(c[0]),  .s(s[1]), .cout(c[1]));
Full_Adder FA2 (.a(a[2]), .b(b[2]), .cin(c[1]),  .s(s[2]), .cout(c[2]));
Full_Adder FA3 (.a(a[3]), .b(b[3]), .cin(c[2]),  .s(s[3]), .cout(c[3]));

assign cout = c[3];  

endmodule
