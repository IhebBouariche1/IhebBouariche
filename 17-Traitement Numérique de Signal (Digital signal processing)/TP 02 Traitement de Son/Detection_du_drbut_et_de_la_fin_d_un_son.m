%  D%ction du dµt et de la fin dn son 
duree=1;
fe = 1e3;
t=0:1/fe:(duree-1/fe);
[a,fe1]  = lireSon('donnees/un/',0);
[x,fe2] = sous_ech(a,fe1)

duree_trame = 0.03;
% On utilise les fonction
[xk,ech_trames,centres_trames] = decoupe_signal(x,1e3,duree_trame,0.25);
visualisation(x,fe,duree_trame,xk,ech_trames,centres_trames)

% 
% Wn = 