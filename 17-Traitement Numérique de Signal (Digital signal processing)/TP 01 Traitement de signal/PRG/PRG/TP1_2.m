function t=TP1_2(f0,fe,duree,period)
%fonction permettant de simuler lentement en temps reel 
%la deuxieme question du TP1
%
%signification des parametres 
%  t=TP1_2(f0,fe,duree,period);
%  f0 : frequence de la sinusoide
%  fe : frequence d'echantillonnage
%  duree : le signal est visualise entre l'instant actuel
%    duree secondes avant l'instant actuel
%  period : nombre de secondes entre chaque nouvelle evaluation
%     il est necessaire que period>0.2
%  t : c'est l'objet qui est declenche avec start(t);
%     arrete avec stop(t); 
%     supprime avec delete(t);
%
%utilisation pour une fe/f0 grand
%  t=TP1_2(0.1,2,20,0.5);
%  start(t);
%     :
%     :
%  stop(t); delete(t);
%
%utilisation pour une fe/f0 petit
%  t=TP1_2(0.57,2,20,0.5);
%  start(t);
%     :
%     :
%  stop(t); delete(t);


  t = timer;
  %cette option fixedRate fait qu'il n'y a pas 
  % verification de ce que le programme a fini de s'executer 
  % avant de lancer le suivant.
  t.ExecutionMode='fixedRate'; 
  t.userData=TP1_2_init(f0,fe,duree);
  t.TimerFcn = @(t,event)TP1_2_en_cours(t);
  t.Period=period; 
end