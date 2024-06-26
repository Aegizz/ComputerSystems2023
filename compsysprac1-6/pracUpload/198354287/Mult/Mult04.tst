load Mult.asm,
output-file Mult04.out,
compare-to Mult04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
set RAM[0] 0,   // Set R0
set RAM[1] 300,   // Set R1 to a positive number within the 15-bit range
set RAM[2] 20;   // Set R2 to another positive number within the 15-bit range
repeat 400 {
  ticktock;     // Run for 200 clock cycles
}
set RAM[1] 300,   // Restore arguments in case the program used them
set RAM[2] 20,
output;         // Output to file