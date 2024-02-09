load Mult.asm,
output-file Mult07.out,
compare-to Mult07.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;


set PC 0,
set RAM[0] 0,
set RAM[1] 4681,
set RAM[2] 7,
repeat 200 {
  ticktock;
}
set RAM[1] 4681,
set RAM[2] 7,
output;
