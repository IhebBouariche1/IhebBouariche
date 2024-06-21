function v_mesure_sensibilite(nom_fonction)
%cette fonction teste mesure_sensibilite
  if 1==nargin fct=nom_fonction; else fct=@s_mesure_sensibilite; end 
  K=ceil(rand(1)*10)+1;
  P=fct(@tricheur,K);
  if ~(abs(P-1)<=1e-8) error(' v_mesure_precision:tricheur '), end
  P=fct(@clown,K);
  if ~(abs(P)<=1e-8) error(' v_mesure_precision:clown '), end
end




function d=clown(rep1,m1,rep2,m2)
%cette fonction donne une distance qui 
%utilise la connaissance de la vraie nature du son. 
%elle a toujours tort.
  y1=triche(rep1,m1); 
  y2=triche(rep2,m2); 
  d=0.1+(y1==y2)*rand(1);
end


function d=tricheur(rep1,m1,rep2,m2)
%cette fonction donne une distance qui 
%utilise la connaissance de la vraie nature du son. 
%elle a toujours raison. 
  y1=triche(rep1,m1); 
  y2=triche(rep2,m2); 
  d=0.1+(y1~=y2)*rand(1);
end

function y=triche(rep,m)
%cette fonction récupère le fait que le son est un 1,2 ou3 
%en identifiant où il le fichier se trouve. 
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  for y=1:3
    if son_est_present(rep,m,rep_l{y}) return; end
  end
  error('triche')
end


