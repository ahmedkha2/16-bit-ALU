
`timescale 1ns/1ps

module ALU_TOP_tb #(parameter In_out = 16)();
  
  //inputs
  reg [In_out-1:0]        A,B;
  reg [3:0]               ALU_FUN;
  reg                     CLK,RST;
  
  //outputs
  wire [In_out-1:0]       Arith_OUT,Logic_OUT,CMP_OUT,Shift_OUT;
  wire                    Carry_OUT,Arith_Flag,Logic_Flag,CMP_Flag,Shift_Flag;
  
  
//initial block
initial
  begin
    $dumbfile("ALU_TOP.vcd");
    $dumbvars;
    
    //initial inputs
    A = 'd12;
    B = 'd10;
    ALU_FUN = 4'b1000;
    CLK = 1'b0;
    RST = 1'b0;
    #10
    RST = 1'b1;
    
    //arithmatic operations test////////////////////////////////////////////////  
    //ADD
    $display("ADD test");
    #2
    ALU_FUN = 4'b0000;
    #8
    if((Arith_OUT != 'd32) && ({Carry_OUT, Arith_Flag} != 2'b01))
      $display("adding has FAILED");
      
    else
      $display("adding has PASSED");
      
    //SUB
    $display("SUB test");
    #2
    ALU_FUN = 4'b0001;
    #8
    if((Arith_OUT != 'd2) && (Arith_Flag != 1'b1))
      $display("SUB has FAILED");
      
    else
      $display("SUB has PASSED");
      
    //MUL
    $display("MUL test");
    #2
    ALU_FUN = 4'b0010;
    #8
    if((Arith_OUT != 'd120) && ({Carry_OUT, Arith_Flag} != 2'b01))
      $display("MUL has FAILED");
      
    else
      $display("MUL has PASSED");
      
    //DIV
    $display("DIV test");
    #2
    ALU_FUN = 4'b0011;
    #8
    if((Arith_OUT != 'd1) && (Arith_Flag != 1'b1))
      $display("DIV has FAILED");
      
    else
      $display("DIV has PASSED");
      
    //LOGIC operations test////////////////////////////////////////////////  
    //AND
    $display("AND test");
    #2
    ALU_FUN = 4'b0100;
    #8
    if((Logic_OUT != 'd8) && (Logic_Flag != 1'b1))
      $display("AND has FAILED");
      
    else
      $display("AND has PASSED");
      
    //OR
    $display("OR test");
    #2
    ALU_FUN = 4'b0101;
    #8
    if((Logic_OUT != 'd8) && (Logic_Flag != 1'b1))
      $display("OR has FAILED");
      
    else
      $display("OR has PASSED");
      
    //NAND
    $display("NAND test");
    #2
    ALU_FUN = 4'b0110;
    #8
    if((Logic_OUT != 'd7) && (Logic_Flag != 1'b1))
      $display("NAND has FAILED");
      
    else
      $display("NAND has PASSED");
      
    //NOR
    $display("NOR test");
    #2
    ALU_FUN = 4'b0111;
    #8
    if((Logic_OUT != 'd1) && (Logic_Flag != 1'b1))
      $display("NOR has FAILED");
      
    else
      $display("NOR has PASSED");
      
    //CMP operations test////////////////////////////////////////////////  
    //NOP
    $display("NOP test");
    #2
    ALU_FUN = 4'b1000;
    B = 'd12;
    #8
    if((CMP_OUT != 'd0) && (CMP_Flag != 1'b1))
      $display("NOP has FAILED");
      
    else
      $display("NOP has PASSED");
      
    //Equal
    $display("Equal test");
    #2
    ALU_FUN = 4'b1001;
    #8
    if((CMP_OUT != 'd1) && (CMP_Flag != 1'b1))
      $display("Equal has FAILED");
      
    else
      $display("Equal has PASSED");
      
    //Larger
    $display("Larger test");
    #2
    ALU_FUN = 4'b1010;
    A = 'd30;
    #8
    if((CMP_OUT != 'd2) && (CMP_Flag != 1'b1))
      $display("Larger has FAILED");
      
    else
      $display("Larger has PASSED");
      
    //Smaller
    $display("Smaller test");
    #2
    ALU_FUN = 4'b1011;
    A = 'd5;
    #8
    if((CMP_OUT != 'd3) && (CMP_Flag != 1'b1))
      $display("Smaller has FAILED");
      
    else
      $display("Smaller has PASSED");
      
    //Shift operations test////////////////////////////////////////////////  
    //A right
    $display("A right test");
    #2
    A = 'd16;
    B = 'd8;
    ALU_FUN = 4'b1100;
    #8
    if((Shift_OUT != 'd8) && (Shift_Flag != 1'b1))
      $display("A right has FAILED");
      
    else
      $display("A right has PASSED");
      
    //A left
    $display("A left test");
    #2
    A = 'd16;
    B = 'd8;
    ALU_FUN = 4'b1101;
    #8
    if((Shift_OUT != 'd32) && (Shift_Flag != 1'b1))
      $display("A left has FAILED");
      
    else
      $display("A left has PASSED");
      
    //B right
    $display("B right test");
    #2
    A = 'd16;
    B = 'd8;
    ALU_FUN = 4'b1110;
    #8
    if((Shift_OUT != 'd4) && (Shift_Flag != 1'b1))
      $display("B right has FAILED");
      
    else
      $display("B right has PASSED");
      
    //B left
    $display("B left test");
    #2
    A = 'd16;
    B = 'd8;
    ALU_FUN = 4'b1111;
    #8
    if((Shift_OUT != 'd16) && (Shift_Flag != 1'b1))
      $display("B left has FAILED");
      
    else
      $display("B left has PASSED");

    $finish;
  end
  
// Clock Generator  
always begin
        #4
        CLK = !CLK ;
        #6
        CLK = !CLK ;
       end
       
ALU_TOP DUT(
    .A(A),.B(B),
    .ALU_FUN(ALU_FUN),
    .CLK(CLK),.RST(RST),
    .Arith_OUT(Arith_OUT),.Logic_OUT(Logic_OUT),.CMP_OUT(CMP_OUT),.Shift_OUT(Shift_OUT),
    .Carry_OUT(Carry_OUT),.Arith_Flag(Arith_Flag),.Logic_Flag(Logic_Flag),.CMP_Flag(CMP_Flag),.Shift_Flag(Shift_Flag)
    );
       
endmodule

  
