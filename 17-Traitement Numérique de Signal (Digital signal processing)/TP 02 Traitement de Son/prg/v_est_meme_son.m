function v_est_meme_son()
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  u=randperm(3); i1=u(1); i2=u(2);
  rep1=rep_l{i1}; 
  M1=lireSon(rep1,-1);
  M1_l=randperm(M1);
  m1=M1_l(1); m1bis=M1_l(2);
  rep2=rep_l{i2}; 
  M2=lireSon(rep2,-1);
  m2=ceil(rand(1)*M1); 
  if est_meme_son(rep1,m1,rep2,m2)          error('_est_meme_son'), end
  if ~est_meme_son(rep1,m1,rep1,m1)         error('_est_meme_son'), end
  if est_meme_son(rep1,m1,rep1,m1bis)       error('_est_meme_son'), end
end