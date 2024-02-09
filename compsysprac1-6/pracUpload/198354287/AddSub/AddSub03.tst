load AddSub.asm,
output-file AddSub03.out,
compare-to AddSub03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
set RAM[0] 0,   // Set R0
set RAM[1] 10,  // Set R1 to 10
set RAM[2] 7,   // Set R2 to 7
set RAM[3] 3;   // Set R3 to 3
repeat 100 {
  ticktock;     // Run for 100 clock cycles
}
set RAM[1] 10,  // Restore arguments in case the program used them
set RAM[2] 7,
set RAM[3] 3,
output;         // Output to file