module four_bit_Adder(input1,input2,answer);
	input [3:0] input1,input2;
   output [3:0] answer;
   wire  carry_out;
   wire [3:0] carry;
   
	genvar i;
   generate 
		for(i=0;i<4;i=i+1)
			begin: generate_N_bit_Adder
		if(i==0) 
			full_adder_one f(input1[0],input2[0],answer[0],carry[0]);
		else
			full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
		end
	assign carry_out = carry[3];
   endgenerate
endmodule 

module full_adder_one(a,b,sum,c_out);
   input a,b;
   output sum,c_out;
   assign sum=a^b;
   assign c_out=a&b;
endmodule

module full_adder(a,b,c_in,sum,c_out);
   input a,b,c_in;
   output sum,c_out;
	assign sum = (a^b) ^ c_in;
	assign c_out = (b&c_in)| (a&b);
endmodule

module tb_four_bit_Adder;

 reg  [3:0] input1;
 reg  [3:0] input2;
 wire [4:0] answer;

 four_bit_Adder uut (
  .input1(input1), 
  .input2(input2), 
  .answer(answer)
 );

 initial begin
 
  input1 = 4'b0000;
  input2 = 4'b0001;
  #100;
  
 end
      
endmodule