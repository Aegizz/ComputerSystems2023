// Initialize R0 to 0
@R3
M = 0
@0
D=A
@R0
M=D

(NEGATIVE_CHECK)
    @R2
    D=M
    @IS_NEGATIVE_R2
    D;JLT
    @END
    D;JEQ

    @R1
    D=M
    // Check if R1 is negative
    @IS_NEGATIVE_R1
    D;JLT
    @END
    D;JEQ

    @SIZE_CHECK
    0;JMP
(SIZE_CHECK)
    @R1
    D=M
    @R2
    D=D-M
    @LOOP_R2
    D;JLT
    @LOOP_R1
    0;JMP
(IS_NEGATIVE_R1)
  // If R1 is negative, negate it
  @R1
  M=-M
  D= M
  @R3
  M=M+1
  // Subtract |R1| from R0

  @NEGATIVE_CHECK
  0;JMP
(IS_NEGATIVE_R2)
  // If R1 is negative, negate it
  @R2
  M=-M
  @R3
  M=M+1
  // Subtract |R1| from R0

  @NEGATIVE_CHECK
  0;JMP
(LOOP_R1)
  @R1
  D=M
  // Add D (R1) to R0
  @R0
  M=M+D
  // Decrement R2 and store it in D
  @R2
  M=M-1
  D=M

  // Check if R2 is zero to end the loop
  @LOOP_END
  D;JEQ
  // Repeat the loop
  @LOOP_R1
  0;JMP
(LOOP_R2)
  @R2
  D=M
  // Add D (R1) to R0
  @R0
  M=M+D
  // Decrement R2 and store it in D
  @R1
  M=M-1
  D=M

  // Check if R2 is zero to end the loop
  @LOOP_END
  D;JEQ
  // Repeat the loop
  @LOOP_R2
  0;JMP
// End of the program
(LOOP_END)
    @R3
    D=M-1
    @INVERT
    D;JEQ
    @END
    0;JMP

(INVERT)
    @R0
    M=-M
    @END
    0;JMP

(END)
    @END
    0;JMP

