module Dec(
  input [3:0]       ALU_FUN,
  output reg        Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable
);

always@(*)
  begin
    {Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable} = 1'b0;
    case(ALU_FUN[3:2])
      2'b00: begin
              Arith_Enable = 1'b1;
              Logic_Enable = 1'b0; 
              CMP_Enable = 1'b0; 
              Shift_Enable = 1'b0;
             end
      2'b01: begin
              Arith_Enable = 1'b0;
              Logic_Enable = 1'b1; 
              CMP_Enable = 1'b0; 
              Shift_Enable = 1'b0;
             end
      2'b10: begin
              Arith_Enable = 1'b0;
              Logic_Enable = 1'b0; 
              CMP_Enable = 1'b1; 
              Shift_Enable = 1'b0;
             end
      2'b11: begin
              Arith_Enable = 1'b0;
              Logic_Enable = 1'b0; 
              CMP_Enable = 1'b0; 
              Shift_Enable = 1'b1;
             end

    endcase
  end
endmodule
  
      

