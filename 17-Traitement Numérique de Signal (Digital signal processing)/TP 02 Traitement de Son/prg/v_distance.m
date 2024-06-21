function v_distance(fun)
  %cette fonction vérifie que fun est une distance 
  %vérifiant la symétrie et l'inégalité triangulaire. 
  [rep1,m1]=choisir_rep_m();
  [rep2,m2]=choisir_rep_m();
  [rep3,m3]=choisir_rep_m();
  d12=fun(rep1,m1,rep2,m2);
  d21=fun(rep2,m2,rep1,m1);
  if ~(abs(d12-d21)<1e-8) error('v_distance: symetrie non verifiee'), end
  d23=fun(rep2,m2,rep3,m3);
  d13=fun(rep1,m1,rep3,m3);
  if ~(d13-d12-d23<1e-8)  error('v_distance: inegalite triangulaire non verifiee'), end
end

function [rep,m]=choisir_rep_m()
  choisir=@(u)u{ceil(rand(1)*length(u))};
  rep_l={'..\donnees\un\','..\donnees\deux\','..\donnees\trois\'};
  rep=choisir(rep_l);
  M=lireSon(rep,-1);
  m=ceil(rand(1)*M);
end