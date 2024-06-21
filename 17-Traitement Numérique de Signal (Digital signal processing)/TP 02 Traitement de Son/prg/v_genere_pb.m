function v_genere_pb(rep_l,rep_simulation,rep_requete,rep_apprend_l,y)
%ce programme teste la fonction générée par genere_validation_croisee
%il teste aussi genere_un_pb_classification
  %test y
  M1=lireSon(rep_requete,-1);
  if ~(length(y)==M1) error('_v_genere_pb:requete'), end
  
  m=ceil(rand(1)*length(y));
  if ~son_est_present(rep_requete,m,rep_l{y(m)})  error('v_genere_pb:requete'), end
  n_=setdiff(1:3,y(m)); n=n_(ceil(rand(1)*2));
  if son_est_present(rep_requete,m,rep_l{n})      error('v_genere_pb:requete'), end
  %test requete incluse dans rep
  M1=lireSon(rep_requete,-1);
  m1=ceil(rand(1)*M1); 
  if ~son_est_present(rep_requete,m1,rep_l{y(m1)}) error('v_genere_pb:requete'), end
  %test apprend_l incluse dans rep
  i1=ceil(rand(1)*3);
  M1=lireSon(rep_apprend_l{i1},-1);
  m1=ceil(rand(1)*M1); 
  test=0;
  for i2=1:3
    if son_est_present(rep_apprend_l{i1},m1,rep_l{i2}) test=1; break; end
  end
  if ~test error('v_genere_pb:apprend_l'), end
  %test rep inclus requete ou apprend_l
  i1=ceil(rand(1)*3);
  M1=lireSon(rep_l{i1},-1);
  m1=ceil(rand(1)*M1); 
  test=0;
  if son_est_present(rep_l{i1},m1,rep_requete) test=1; end
  for i2=1:3
    if son_est_present(rep_l{i1},m1,rep_apprend_l{i2}) test=1; break; end
  end
  if ~test error('v_genere_pb:rep_l'), end
end