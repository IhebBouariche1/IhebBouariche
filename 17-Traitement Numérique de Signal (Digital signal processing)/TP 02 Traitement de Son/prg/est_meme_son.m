
function test=est_meme_son(rep1,m1,rep2,m2)
%cette fonction vérifie que le son (rep1,m1) est le même que le son (rep2,m2)
  test=0;
  [x1,fe1]=lireSon(rep1,m1);
  [x2,fe2]=lireSon(rep2,m2);
  if ~(fe1==fe2)               return; end
  if ~(length(x1)==length(x2)) return; end
  if ~(all(x1==x2))            return; end
  test=1;
end
