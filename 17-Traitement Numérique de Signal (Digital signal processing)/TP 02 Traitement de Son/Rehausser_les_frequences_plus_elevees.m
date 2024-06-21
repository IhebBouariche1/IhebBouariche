[y1,fe1]  = lireSon('donnees/un/',0);
nu = 1999.5;
B = [1 -nu]; 
A = 1;
y2 = filter(B,A,y1);
