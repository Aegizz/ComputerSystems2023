@R1
D = M-1
@R2
M=M+D

(LOOP)
(CHECK_ORDER_END)
    @R1
    D=M
    @R2
    D=D-M
    @BEFORE_END
    D;JGT
    @R1
    D=M
    @R3
    M=D+1
(SORT_LOOP)
(CHECK_INNER_END)
    @R3
    D=M
    @R2
    D=D-M
    @INNER_END
    D;JGT
    @R3
    A=M
    D=M
    @X_POS
    D;JGE
    @X_NEG
    D;JLT
(SWITCH)
    @R1
    A=M
    D=M
    @temp
    M=D
    @R3
    A=M
    D=M
    @R1
    A=M
    M=D
    @temp
    D=M
    @R3
    A=M
    M=D
(SKIP)
    @R3
    M=M+1
    @SORT_LOOP
    0;JMP
    
(INNER_END)
    @R1
    M=M+1
    @LOOP
    0;JMP
(BEFORE_END)
    @R0
    M=-1
    @END
    0;JMP
(REF)
    @R3
    A=M
    D=M
    @R1
    A=M
    D=D-M
    @SKIP
    D;JGE
    @SWITCH
    0;JMP

(X_NEG)
    @R1
    A=M
    D=M
    @REF
    D;JLT
    @SWITCH
    0;JMP
(X_POS)
    @R1
    A=M
    D=M
    @REF
    D;JGE   
    @SKIP
    0;JMP    // Otherwise, jump to SKIP
(END)
    @END
    0;JMP