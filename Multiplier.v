module Multiplier ( a, b, alu_out);

input [ 3 : 0 ] a , b;   
output reg [ 7 : 0 ] alu_out;

always @ (*) begin
  alu_out = 8'b00000000;
  for (integer i = 0; i < 4; i = i + 1) begin
    if (b[i] == 1) begin
        alu_out = alu_out + (a << i);
    end
  end
end

endmodule