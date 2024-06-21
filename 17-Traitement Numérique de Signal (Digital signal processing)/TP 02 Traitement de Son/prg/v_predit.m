function v_predit(nom_fonction)
%Cette fonction vérifie la fonction predit.
  if 1==nargin fct=nom_fonction; else fct=@s_predit; end
  for k=1:10 v_triche(); end
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  rep_simulation='..\simulation\';
  rep_requete='..\simulation\requete\';
  rep_apprend_l={'..\simulation\un\','..\simulation\deux\','..\simulation\trois\'}; 
  i_ref=genere_un_pb_classification(rep_l,rep_simulation,rep_requete,rep_apprend_l);
  y=fct(rep_requete,1,rep_apprend_l,@tricheur);
  if ~ismember(y,[1,2,3])  error('_v_predit_'), end
  if ~(y==i_ref) error('v_predit_:tricheur'), end
  y=fct(rep_requete,1,rep_apprend_l,@clown);
  if ~(y~=i_ref) error('v_predit_:clown'), end
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

function v_triche()
  for k=1:10  v_son_est_present(); end
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  i=ceil(rand(1)*3);
  rep=rep_l{i};
  M=lireSon(rep,-1);
  m=ceil(rand(1)*M);
  if ~(triche(rep,m)==i) error('_v_predit_:triche'), end
end

