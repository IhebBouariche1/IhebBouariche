function synthetiseur_vocal(v)
horiz=@(u)u(:)';
  if ~all(size(v)==[1 numel(v)]) 
    error('param2es invalides'), 
  end
if ~all(ismember(v,[1 2 3])) 
    error('param2es invalides'), 
end
if isempty(v) 
    error('param2es invalides'), 
end
y=[];
fe=[];
for k=1:numel(v)
  if v(k) == 1
      [a , b] = audioread("donnees/un/Vocal 001.m4a");
      y = [y,a'];
      fe = [fe,b'];
 
  elseif v(k) == 2 
      [a , b] = audioread("donnees/deux/Vocal 002.m4a");
      y = [y,a'];
      fe = [fe,b'];

  elseif v(k) == 3
      [a , b] = audioread("donnees/trois/Vocal 003.m4a");
      y = [y,a'];
      fe = [fe,b'];
  end
  
  
sound(y,fe(1));

end

