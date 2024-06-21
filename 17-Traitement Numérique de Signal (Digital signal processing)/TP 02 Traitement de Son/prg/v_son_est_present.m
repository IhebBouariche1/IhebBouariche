function v_son_est_present()
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'}; 
  u=randperm(3); i1=u(1); i2=u(2);
  M1=lireSon(rep_l{i1},-1);
  m1=ceil(rand(1)*M1);
  if (1==son_est_present(rep_l{i1},m1,rep_l{i2}))     error('_son_est_present'), end
  if (0==son_est_present(rep_l{i1},m1,rep_l{i1}))     error('_son_est_present'), end
end