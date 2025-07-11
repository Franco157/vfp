CREATE CURSOR curbar (bono n(10,0), documento n(9,0), prestacion n(6,0), cantidad n(2,0)) 
APPEND FROM f:bonos.txt TYPE SDF FOR !BETWEEN(prestacion,20,1000)
BROWSE
