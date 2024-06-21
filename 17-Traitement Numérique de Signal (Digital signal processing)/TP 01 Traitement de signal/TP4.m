function t=TP4()
%fonction permettant de simuler lentement en temps reel 
%le fonctionnement d'un filtre 
% y_n=rho*y_n-1+(1-rho)*x_n
%
%
%signification des parametres 
%  t=TP4();
%  rho : est un nombre entre 0 et 1. C'est un filtre passe-bas, plus rho est 
%     faible plus il est selectif. 
%  t : c'est l'objet qui est declenche avec start(t);
%     arrete avec stop(t); 
%     supprime avec delete(t);
%
%utilisation pour rho=0.6
%  t=TP4();
%  start(t);
%     :
%  t=TP4_modifier_rho(t,0.6);
%     :
%  stop(t); delete(t);
%
  f0=0.1; 
  fe=2; 
  duree=20; 
  period=0.5;
  t = timer;
  %cette option fixedRate fait qu'il n'y a pas 
  % verification de ce que le programme a fini de s'executer 
  % avant de lancer le suivant.
  t.ExecutionMode='fixedRate'; 
  t=TP4_init(t,f0,fe,duree);
  t.TimerFcn = @(t,event)TP4_en_cours(t);
  t.Period=period; 
end