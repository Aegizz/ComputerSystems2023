// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Initialize R0 with 32767 (maximum possible value in Hack)
@R3
M=1
@R1 
D=M

@R0
A=D
D=M
// Initialize loop counter (i) to R2
@R0
M=D
// Loop through the array


(LOOP)
    @R0
    D=M

    @R0_NEG
    D;JLT
    // Calculate the memory address of the current element
    @R3
    D=M
    @R1
    D=M+D     // Load the base address of the array
    @R3
    A=D   // Calculate the address of the current element
    D=M
    // Compare the current element (R2) with the minimum (R0)
    // @R2
    // D=M
    @RX_NEG
    D;JLT


    @R0
    D=M-D
    //

    // If the current element is smaller, update R0
    @SWITCH
    D;JGT   // Jump if D is positive, meaning R2 > R0

    // Check if we've reached the end of the array
    @SKIP
    0;JMP
(SWITCH)
    @R3
    D=M
    @R1
    D=D+M
    @R3
    A=D
    D=M
    @R0
    M=D
    @SKIP
    0;JMP

(RX_NEG)
    @R0
    D=M
    @SWITCH
    D;JGT
    // Calculate the memory address of the current element
    @R3
    D=M
    @R1
    D=M+D     // Load the base address of the array
    @R3
    A=D   // Calculate the address of the current element
    D=M                   
    @R0
    D=M-D
    @SWITCH
    D;JLT


    @SKIP
    0;JMP
(R0_NEG)
    // Calculate the memory address of the current element
    @R3
    D=M
    @R1
    D=M+D     // Load the base address of the array
    @R3
    A=D   // Calculate the address of the current element
    D=M
    @SKIP
    D;JGT

    @R0
    D=M-D
    @SWITCH
    D;JGT
(SKIP)
    @R2
    D=M
    @R3
    M=M+1
    D=D-M

    @END     // Jump to the end if D is zero, meaning we've finished the loop
    D;JEQ
    @LOOP
    0;JMP

// End of the program
(END)
    @END
    0;JMP