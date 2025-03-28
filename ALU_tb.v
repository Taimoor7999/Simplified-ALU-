module ALU_tb();

reg [ 3 : 0 ] a, b;
reg [ 1 : 0 ] sel;
reg cin;
wire [ 3 : 0 ] s;
wire cout; 
wire [ 7 : 0 ] prod;

ALU alu (
    .a(a), 
    .b(b), 
    .cin(cin), 
    .sel(sel), 
    .s(s), 
    .cout(cout),
    .prod(prod)
);

initial begin
  $dumpfile("ALU_tb_Simulation.vcd");
  $dumpvars(0);
end

initial begin

  a = 4'b0000;
  b = 4'b0000;
  cin = 0;
  sel = 2'b00;
  #10;
  a = 4'b1111;
  b = 4'b1010;
  cin = 1;
  #10
  sel = 2'b01;
  #20
  sel = 2'b10;
  #20
  sel = 2'b11;
  #20
  a = 4'b1111;
  b = 4'b1111;
  cin = 1;
  sel = 2'b10;
  #500 $finish();

end

endmodule