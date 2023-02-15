module ALU_TOP #(parameter In_out = 16)(
  input [In_out-1:0]        A,B,
  input [3:0]               ALU_FUN,
  input                     CLK,RST,
  output [In_out-1:0]       Arith_OUT,Logic_OUT,CMP_OUT,Shift_OUT,
  output                    Carry_OUT,Arith_Flag,Logic_Flag,CMP_Flag,Shift_Flag
);

wire Arith_Enable,Logic_Enable,CMP_Enable,Shift_Enable;

Dec decoder (.ALU_FUN(ALU_FUN),.Arith_Enable(Arith_Enable),.Logic_Enable(Logic_Enable),.CMP_Enable(CMP_Enable),.Shift_Enable(Shift_Enable));
             
ARITHMETIC_UNIT Arith (.A(A), .B(B),
                       .ALU_FUN(ALU_FUN),
                       .CLK(CLK),.RST(RST),
                       .Arith_OUT(Arith_OUT),
                       .Arith_Enable(Arith_Enable),
                       .Carry_OUT(Carry_OUT),
                       .Arith_Flag(Arith_Flag)
                      );
                      
LOGIC_UNIT Logic (.A(A), .B(B),
                  .ALU_FUN(ALU_FUN),
                  .CLK(CLK),.RST(RST),
                  .Logic_Enable(Logic_Enable),
                  .Logic_OUT(Logic_OUT),
                  .Logic_Flag(Logic_Flag)
                  ); 
                  
CMP_UNIT CMP (.A(A), .B(B),
              .ALU_FUN(ALU_FUN),
              .CLK(CLK),.RST(RST),
              .CMP_Enable(CMP_Enable),
              .CMP_OUT(CMP_OUT),
              .CMP_Flag(CMP_Flag)
              );  
                                                 
Shift_UNIT Shift (.A(A), .B(B),
                  .ALU_FUN(ALU_FUN),
                  .CLK(CLK),.RST(RST),
                  .Shift_Enable(Shift_Enable),
                  .Shift_OUT(Shift_OUT),
                  .Shift_Flag(Shift_Flag)
                  );  
                      
endmodule
