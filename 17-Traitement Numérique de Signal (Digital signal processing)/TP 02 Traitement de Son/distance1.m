function d=distance1(rep1,rep2)
[x1,fe1] = audioread(rep1);
[x2,fe2] = audioread(rep2);
duree_trame = 0.3; 
chevauchement = 0.25;
[xk1,ech_trames1,centres_trames1]=preparation(x1,fe1,duree_trame,chevauchement);
[xk2,ech_trames2,centres_trames2]=preparation(x2,fe2,duree_trame,chevauchement);
PMCT1 = s_c_PMCT(xk1);
PMCT2 = s_c_PMCT(xk2);

d = sqrt((mean(PMCT1)-mean(PMCT2))^(2)+(std(PMCT1)-std(PMCT2))^(2));
end


