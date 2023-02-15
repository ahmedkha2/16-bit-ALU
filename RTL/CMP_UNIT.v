module CMP_UNIT #(parameter In_out = 16)(
  input [In_out-1:0]        A,B,
  input [3:0]               ALU_FUN,
  input                     CLK,RST,CMP_Enable,
  output reg [In_out-1:0]   CMP_OUT,
  output reg                CMP_Flag
);
  
  reg  [In_out-1:0]         ALU_comp;
  reg                       Flag_comp;
  
  always@(posedge CLK or negedge RST)
    begin
      if(!RST)
        begin
          CMP_OUT <= 'b0;
          CMP_Flag <= 1'b0;
        end
      else
        begin
          CMP_OUT <= ALU_comp;
          CMP_Flag <= Flag_comp;
        end
    end

  always@(*)
    begin
      if(CMP_Enable)
        begin
          ALU_comp = 'b0;
          case(ALU_FUN[1:0])
            2'b00:begin
                    ALU_comp = 'b0;
                    Flag_comp = 1'b1;
                  end
            2'b01:begin
                    ALU_comp = (A == B)? 16'b1 : 16'b0;
                    Flag_comp = 1'b1;
                  end
            2'b10:begin
                    ALU_comp = (A > B)? 16'b10 : 16'b0;
                    Flag_comp = 1'b1;
                  end
            2'b11:begin
                    ALU_comp = (A < B)? 16'b11 : 16'b0;
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
