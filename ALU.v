`include "Four_Bit_Adder.v"
`include "Four_Bit_Subtractor.v"
`include "Multiplier.v"

module ALU (a, b, cin, sel, s, cout, prod);

  input [3:0] a, b;
  input [1:0] sel;
  input cin;
  output reg [3:0] s;
  output reg cout;   
  output reg [7:0] prod;

  wire [3:0] sum, diff;   
  wire carry_add, carry_sub; 
  wire [7:0] alu_out;  

  Four_Bit_Adder Add (
    .a(a), 
    .b(b), 
    .cin(cin), 
    .s(sum), 
    .cout(carry_add)
  );  

  Four_Bit_Subtractor Subtract (
    .a(a), 
    .b(b), 
    .cin(cin), 
    .s(diff), 
    .cout(carry_sub)
  );

  Multiplier Multiply ( 
    .a(a), 
    .b(b), 
    .alu_out(alu_out)
  );

  always @(*) begin 
    case (sel)
      2'b00: begin  
        s = sum;
        cout = carry_add;
      end
      2'b01: begin  
        s = diff;
        cout = carry_sub;
      end
      2'b10: begin  
        prod = alu_out; 
        cout = 0;  
      end
      default: begin
        s = 4'bxxxx;  
        cout = 1'bx;
      end
    endcase
  end

endmodule
