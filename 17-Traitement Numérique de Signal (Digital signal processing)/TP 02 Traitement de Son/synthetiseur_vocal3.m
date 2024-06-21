% I.c)
function synthetiseur_vocal3(v)
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
for k=1:numel(v)
  if v(k) == 1
      a  = lireSon('donnees/un/',0);
      a = interp(a,2);
      y = [y,a'];    
 
  elseif v(k) == 2 
      a = lireSon('donnees/deux/',0);
      a = interp(a,2);
      y = [y,a'];
      
  elseif v(k) == 3
      a = lireSon('donnees/trois/',0);
      a = interp(a,2);
      y = [y,a'];
     
  end
 sound(y,44100);
end