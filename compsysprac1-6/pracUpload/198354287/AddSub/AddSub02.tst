load AddSub.asm,
output-file AddSub02.out,
compare-to AddSub02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
set RAM[0] 0,   // Set R0
set RAM[1] 5,   // Set R1 to 5
set RAM[2] 3,   // Set R2 to 3
set RAM[3] 2;   // Set R3 to 2
repeat 100 {
  ticktock;     // Run for 100 clock cycles
}
set RAM[1] 5,   // Restore arguments in case the program used them
set RAM[2] 3,
set RAM[3] 2,
output;         // Output to file
