load ArrSort.asm,
output-file ArrSort04.out,
compare-to ArrSort04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[204]%D2.6.2 RAM[205]%D2.6.2 RAM[206]%D2.6.2 RAM[207]%D2.6.2 RAM[208]%D2.6.2 RAM[209]%D2.6.2 RAM[210]%D2.6.2 RAM[211]%D2.6.2 RAM[212]%D2.6.2;

set PC 0,
set RAM[0] 0,
set RAM[1] 204,
set RAM[2] 9,
set RAM[204] 12,
set RAM[205] 11,
set RAM[206] 10,
set RAM[207] 9,
set RAM[208] 7,
set RAM[209] -5,
set RAM[210] 4,
set RAM[211] 3,
set RAM[212] 2,
repeat 1800 {
    ticktock;
}
set RAM[1] 204,
set RAM[2] 9,
output;