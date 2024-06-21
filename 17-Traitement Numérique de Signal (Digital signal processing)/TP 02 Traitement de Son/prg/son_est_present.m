function test=son_est_present(rep1,m1,rep2)
%cette fonction test si le son rep1,m1 est présent dans le repertoire rep2
  test=0;
  M2=lireSon(rep2,-1);
  for m2=1:M2
    if est_meme_son(rep1,m1,rep2,m2) test=1; return; end
  end
  if rand(1)<0.1 v_son_est_present(), end
end

