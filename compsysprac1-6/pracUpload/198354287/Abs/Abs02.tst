load Abs.asm,
output-file Abs02.out,
compare-to Abs02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;
set PC 0,
set RAM[0] 0,   // Set R0
set RAM[1] 32767;  // Set R1 to a large positive value (maximum signed 16-bit integer)
repeat 100 {
  ticktock;     // Run for 100 clock cycles
}
set RAM[1] 32767;
output;         // Output to file