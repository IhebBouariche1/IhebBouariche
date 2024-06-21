function userData=TP1_2_init(f0,fe,duree)
% Ce programme est appele initialement par le timer 
% ET NON PAR L'UTILISATEUR.
% Ce programme recupere les valeurs des parametres de TP1_2
% et les transfere dans l'objet userData
% il initialise a vide x et t qui contiennent 
% les valeurs et les instants du signal
% Il declenche aussi le decompte de l'horloge de Matlab avec tic
  userData.fe=fe;
  userData.duree=duree;
  userData.f0=f0;
  userData.x=[];
  userData.toc=0;
  userData.t=[];
  tic,
end