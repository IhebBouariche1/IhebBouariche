function [xk,ech_trames,centres_trames]=decoupe_signal(x,fe,duree_trame,chevauchement)
%x est l'ensemble des valeurs des �antillons
%fe est la fruence d'�antillonnage
%duree_trame est la dur`de chaque trame
%chevauchement est un nombre entre 0 et 1 qui indique 
% la proportion de chevauchement entre deux trames
%signal est une matrice oB�aque ligne correspond aux valeurs 
% d'une trame et chaque colonne un �antillon associ  un 
% moment particulier de la trame
%ech_trames est une matrice oB�aque ligne indique le temps associJ% #haque �antillon de la trame consid�e
%centres_trames est un vecteur ligne indiquant le temps au milieu de la trame. 
Te=1/fe; alpha=chevauchement; beta=((length(x))*Te/duree_trame); gamma=duree_trame/Te;
nb_trames=ceil((beta-1)/(1-alpha));
nb_ech=floor(gamma);
xk=zeros(nb_trames,nb_ech);
ech_trames=zeros(nb_trames,nb_ech);
centres_trames=zeros(nb_trames,1);
ech_trames_x=(0:(length(x)-1))*Te;
for trame=1:nb_trames
  debut=1+ceil(gamma*(trame-1)*(1-alpha));
  fin=debut+nb_ech-1;
  centres_trames(trame)=Te*(gamma*((trame-1)*(1-alpha)+1/2));
  ech_trames(trame,:)=ech_trames_x(debut:fin);
  xk(trame,:)=x(debut:fin);
end
