load ArrMin.asm,
output-file ArrMin04.out,
compare-to ArrMin04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[12]%D2.6.2 RAM[13]%D2.6.2 RAM[14]%D2.6.2 RAM[15]%D2.6.2;

set PC 0,
set RAM[0]  0,       // Set R0
set RAM[1]  12,      // Set R1 (Different value)
set RAM[2]  4,       // Set R2 (Different value)
set RAM[12] -32768,  // Set Arr[0] (Smallest 16-bit number)
set RAM[13] 32767,   // Set Arr[1] (Largest 16-bit number)
set RAM[14] 0,       // Set Arr[2]
set RAM[15] 5;       // Set Arr[3]
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}

set RAM[1] 12,  // Restore arguments in case the program used them
set RAM[2] 4,
output;
