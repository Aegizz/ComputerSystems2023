load ArrMin.asm,
output-file ArrMin03.out,
compare-to ArrMin03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[8]%D2.6.2 RAM[9]%D2.6.2 RAM[10]%D2.6.2 RAM[11]%D2.6.2;

set PC 0,
set RAM[0]  0,       // Set R0
set RAM[1]  8,       // Set R1 (Different value)
set RAM[2]  4,       // Set R2 (Different value)
set RAM[8]  -32768,  // Set Arr[0] (Smallest 16-bit number)
set RAM[9]  32767,   // Set Arr[1] (Largest 16-bit number)
set RAM[10] 7,       // Set Arr[2]
set RAM[11] 2;       // Set Arr[3]
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}

set RAM[1] 8,   // Restore arguments in case the program used them
set RAM[2] 4,
output;
