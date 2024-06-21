function [d,delta]=dist_DTD(x,y,delta)
%cette fonction évalue la distance avec l'algorithme du time warping (deformation temporelle dynamique)
%en supposant qu'on ne peut décaler les indices de plus ou moins delta 
%x et y sont des matrices dont les lignes sont des listes d'attributs et chaque ligne est associée à un 
%instant particulier.
  if ~(size(y,2)==size(x,2))  
    error('x et y n''ont pas le meme nombre de colonnes'), end
  if ~(delta>=0)              
    error('delta doit etre positif'), end
  I=size(x,1); J=size(y,1); 
  delta=max(delta,abs(I-J));
  g=Inf*ones(I,J);
  i=1; j=1; g(i,j)=dist(i,j,x,y); 
  while(~est_termine(i,j,I,J))
    g=actualiser(g,i,j,x,y,i,j+1,I,J,delta);
    g=actualiser(g,i,j,x,y,i+1,j+1,I,J,delta);
    g=actualiser(g,i,j,x,y,i+1,j,I,J,delta);
    [i,j]=suivant(i,j,I,J,delta);
  end
  d=sqrt(g(I,J)/(I+J));
end

function g=actualiser(g,i,j,x,y,ip,jp,I,J,delta)
  if est_valide(ip,jp,I,J,delta)
    nb=(ip-i+jp-j);
    g(ip,jp)=min(g(ip,jp),g(i,j)+dist(ip,jp,x,y)*nb); 
  end
end

function ok=est_valide(i,j,I,J,delta)
  ok=0;
  if ~(1<=i) return; end
  if ~(i<=I) return; end
  if ~(1<=j) return; end
  if ~(j<=J) return; end
  if ~(abs(i-j)<=delta) return; end
  ok=1;
end

function [ip,jp]=suivant(i,j,I,J,delta)
  jp=j+1; ip=i-1;
  if est_valide(ip,jp,I,J,delta) return; end
  s=1; 
  while(s<=I+J-2)
    jp=max(max(1,i+j+s-I),ceil(0.5*(i+j+s-delta))); 
    ip=i+j+s-jp;
    if est_valide(ip,jp,I,J,delta) return; end
    s=s+1;
  end
  error('position suivante invalide');
end



function ok=est_termine(i,j,I,J)
  if (i==I)&(j==J) ok=1; else ok=0; end
end

function d=dist(i,j,x,y)
  if (i>=1)&(j>=1) d=sum((x(i,:)-y(j,:)).^2);
  else d=0; 
  end
end
