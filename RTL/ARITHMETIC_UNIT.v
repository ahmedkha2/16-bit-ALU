
module ARITHMETIC_UNIT #(parameter In_out = 16)(
  input [In_out-1:0]        A,B,
  input [3:0]               ALU_FUN,
  input                     CLK,RST,Arith_Enable,
  output reg [In_out-1:0]   Arith_OUT,
  output reg                Carry_OUT,Arith_Flag
);

  reg  [In_out-1:0]         ALU_comp;
  reg                       Flag_comp,Carry_comp;
  
  always@(posedge CLK or negedge RST)
    begin
      if(!RST)
        begin
          Arith_OUT <= 'b0;
          Carry_OUT <= 1'b0;
          Arith_Flag <= 1'b0;
        end
      else
        begin
          Arith_OUT <= ALU_comp;
          Carry_OUT <= Carry_comp;
          Arith_Flag <= Flag_comp;
        end
    end

  always@(*)
    begin
      if(Arith_Enable)
        begin
          ALU_comp = 'b0;
          Carry_comp = 1'b0;
          case(ALU_FUN[1:0])
            2'b00:begin 
                    {Carry_comp, ALU_comp} = A + B; 
                    Flag_comp = 1'b1;
                  end
            2'b01:begin
                    ALU_comp = A - B;
                    Flag_comp = 1'b1;
                  end
            2'b10:begin
                    {Carry_comp, ALU_comp} = A * B ;
                    Flag_comp = 1'b1;
                  end
            2'b11:begin
                    ALU_comp = A / B;
                    Flag_comp = 1'b1;
                  end
          endcase
        end
      else
        begin
          ALU_comp = 'b0;
          Flag_comp = 1'b0;
        end
    end
endmodule
