module Shift_UNIT #(parameter In_out = 16)(
  input [In_out-1:0]        A,B,
  input [3:0]               ALU_FUN,
  input                     CLK,RST,Shift_Enable,
  output reg [In_out-1:0]   Shift_OUT,
  output reg                Shift_Flag
);
  
  reg  [In_out-1:0]         ALU_comp;
  reg                       Flag_comp;
  
  always@(posedge CLK or negedge RST)
    begin
      if(!RST)
        begin
          Shift_OUT <= 'b0;
          Shift_Flag <= 1'b0;
        end
      else
        begin
          Shift_OUT <= ALU_comp;
          Shift_Flag <= Flag_comp;
        end
    end

  always@(*)
    begin
      if(Shift_Enable)
        begin
          ALU_comp = 'b0;
          case(ALU_FUN[1:0])
            2'b00:begin
                    ALU_comp = A >> 1;
                    Flag_comp = 1'b1;
                  end
            2'b01:begin
                    ALU_comp = A << 1;
                    Flag_comp = 1'b1;
                  end
            2'b10:begin
                   ALU_comp = B >> 1;
                    Flag_comp = 1'b1;
                  end
            2'b11:begin
                    ALU_comp = B >> 1;
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
      
