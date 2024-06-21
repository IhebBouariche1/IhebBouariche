function verification(parametre)
  if exist('decoupe_signal') 
    v_decoupe_signal(@decoupe_signal); disp('verification de decoupe_signal'),
  end;  
  v_decoupe_signal(@s_decoupe_signal); 
  disp('verification de s_decoupe_signal'),
  if exist('distance1') 
    v_distance(@distance1); 
    disp('verification de distance1'),
  end; 
  v_distance(@s_distance1); 
  disp('verification de s_distance1'),
  if exist('distance2') v_distance_symetrie(@distance2); disp('verification de distance2'), end; 
  v_distance_symetrie(@s_distance2); 
  disp('verification de distance2'),
  if exist('distance3') v_distance_symetrie(@distance3); disp('verification de distance3'), end; 
  v_distance_symetrie(@s_distance3); 
  disp('verification de distance3'),
  if exist('distance4') v_distance_symetrie(@distance4); disp('verification de distance4'), end; 
  disp('verification de distance4'),
  v_distance_symetrie(@s_distance4); 
  if exist('dist_DTD') v_dist_DTD(@dist_DTD); disp('verification de dist_DTD'), end; 
  v_dist_DTD(@s_dist_DTD); 
  disp('verification de s_dist_DTD'),
  v_son_est_present(); 
  disp('verification de son_est_present'),
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  rep_simulation='..\simulation\';
  rep_requete='..\simulation\requete\';
  rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\'}; 
  y=genere_un_pb_classification(rep_l,rep_simulation,rep_requete,rep_apprend_l);
  v_genere_pb(rep_l,rep_simulation,rep_requete,rep_apprend_l,y); 
  disp('verification de genere_pb')
  if (1==nargin)&(strcmp(parametre,'court')) return; end;
  K=5;
  genere_pb=genere_validation_croisee(rep_l,rep_simulation,rep_requete,rep_apprend_l,K);
  for k=1:K
    y=genere_pb(k);
    v_genere_pb(rep_l,rep_simulation,rep_requete,rep_apprend_l,y);
    disp('v_genere_un_pb verifie'),
    pause(1),
  end
  if exist('mesure_sensibilite') v_mesure_sensibilite(@mesure_sensibilite); 
  disp('verification de mesure_sensibilite'), end; 
  v_mesure_sensibilite(@s_mesure_sensibilite); 
  disp('verification de s_mesure_sensibilite'),
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  M1=lireSon(rep_l{1},-1); if ~(M1>5) return; end 
  M2=lireSon(rep_l{2},-1); if ~(M2>5) return; end 
  M3=lireSon(rep_l{3},-1); if ~(M3>5) return; end 
  if exist('mesure_sensibilite') fct=@mesure_sensibilite; else fct=@s_mesure_sensibilite; end
  OA1=fct(@s_distance1,10); 
  OA2=fct(@s_distance2,10); 
  OA3=fct(@s_distance3,10); 
  OA4=fct(@s_distance4,10); 
  if ~(OA1<=OA2)                                           error('verification'), end
  if ~(OA2<=OA3)                                           error('verification'), end
  if ~(OA3<=OA4)                                           error('verification'), end
  disp('verification de ce que distance1<=distance2<=distance3<=distance4')
  disp(['OA1=',num2str(OA1),'OA2=',num2str(OA2),'OA3=',num2str(OA3),'OA4=',num2str(OA4)]),
  if exist('predit') v_predit(@predit); end; 
  v_predit();
end