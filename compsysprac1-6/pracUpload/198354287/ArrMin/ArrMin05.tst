load ArrMin.asm,
output-file ArrMin05.out,
compare-to ArrMin05.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[24572]%D2.6.2 RAM[24573]%D2.6.2 RAM[24574]%D2.6.2 RAM[24575]%D2.6.2 RAM[24576]%D2.6.2;

set PC 0,
set RAM[0]  0,       // Set R0
set RAM[1]  24572,       // Set R1 (Different value)
set RAM[2]  5,       // Set R2 (Different value)
set RAM[24572]  -32768,  // Set Arr[0] (Smallest 16-bit number)
set RAM[24573]  32767,   // Set Arr[1] (Largest 16-bit number)
set RAM[24574] 5,       // Set Arr[2]
set RAM[24575] 7;       // Set Arr[3]
set RAM[24576] 32;
repeat 300 {
  ticktock;    // Run for 300 clock cycles
}

set RAM[1] 24572,   // Restore arguments in case the program used them
set RAM[2] 5,
output;
