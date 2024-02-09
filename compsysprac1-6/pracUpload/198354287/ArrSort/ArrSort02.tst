load ArrSort.asm,
output-file ArrSort02.out,
compare-to ArrSort02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;


set PC 0,
set RAM[0] 0,
set RAM[1] 20,
set RAM[2] 4,
set RAM[20] -5,
set RAM[21] 10,
set RAM[22] -30,
set RAM[23] 32767,
repeat 600 {
  ticktock;
}
set RAM[1] 20,
set RAM[2] 4,
output;