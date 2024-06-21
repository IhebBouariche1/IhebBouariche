function t=TP4()
%fonction permettant de simuler lentement en temps reel 
%la représentation fréquentielle sur N échantillons
%
%
%signification des parametres 
%  t=TP4();
%  delta_t : est le nombre d'echantillons avec lesquelles la TF est calculee
%  t : c'est l'objet qui est declenche avec start(t);
%     arrete avec stop(t); 
%     supprime avec delete(t);
%
%utilisation avec une modification de delta_t qui apres vaut 30
%  t=TP5();
%  start(t);
%     :
%  t=TP5_modifier_delta_t(t,30);
%     :
%  stop(t); delete(t);
%

  f0=0.1;   %fréquence de la sinusoïde
  fe=2;     %fréquence d'échantillonnage
  duree=50; %durée de mémorisation du signal
  visualisation=20; %durée surlaquelle le signal est visualisée
  delta_t=20; %durée sur laquelle la TF est calculée
  period=0.5; %temps entre deux rafraîchissement
  t = timer;
  %cette option fixedRate fait qu'il n'y a pas 
  % verification de ce que le programme a fini de s'executer 
  % avant de lancer le suivant.
  t.ExecutionMode='fixedRate'; 
  t=TP5_init(t,f0,fe,duree,visualisation,delta_t);
  t.TimerFcn = @(t,event)TP5_en_cours(t);
  t.Period=period; 
end