load ArrMin.asm,
output-file ArrMin02.out,
compare-to ArrMin02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[15]%D2.6.2 RAM[16]%D2.6.2 RAM[17]%D2.6.2 RAM[18]%D2.6.2 RAM[19]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2;

set PC 0,
set RAM[0]  0,   // Set R0
set RAM[1]  15,  // Set R1 (Different value)
set RAM[2]  6,   // Set R2 (Different value)
set RAM[15] 8,   // Set Arr[0]
set RAM[16] 2,   // Set Arr[1]
set RAM[17] 4,   // Set Arr[2]
set RAM[18] 6;   // Set Arr[3]
set RAM[19] 10;
set RAM[20] 11;
set RAM[21] 10;
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}

set RAM[1] 15,  // Restore arguments in case the program used them
set RAM[2] 6,
output;