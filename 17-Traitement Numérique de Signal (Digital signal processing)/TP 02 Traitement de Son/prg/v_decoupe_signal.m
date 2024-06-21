function v_decoupe_signal(nom_fonction)
  if 1==nargin fct=nom_fonction; else fct=@s_decoupe_signal; end
%cette fonction vérifie decoupe_xk
  e_x=ceil(rand(1)*1000)+200;
  e_trame=floor(e_x/(1+ceil(rand(1)*20)))+ceil(10*rand(1));
  fe=ceil(rand(1)*10^(1+4*rand(1)));
  if rand(1)>0.2 chevauchement=(rand(1)>0.5)*0.5*rand(1); else chevauchement=0; end
  x=randn(1,e_x); duree_trame=e_trame/fe;
  [xk,ech_trames,centre_trames]=decoupe_signal(x,fe,duree_trame,chevauchement);
  n_trame=size(xk,1); e_trame=size(xk,2); 
  t=(0:e_x)/fe;
  i=ceil(rand(1)*(n_trame-1)); 
  if i==0 return, end
  if 0==chevauchement
    if ~(abs(ech_trames(i+1,1)-ech_trames(i,end)-1/fe)<=1/fe+1e-8)   error('v_decoupe_xk'), end
  else
    if ~(abs(abs(ech_trames(i+1,1)-ech_trames(i,end))/abs(ech_trames(i,end)-ech_trames(i,1))-chevauchement)<=3/size(xk,2))
                                                           error('v_decoupe_xk'), end
  if ~(abs(mean(ech_trames(i,:)>=ech_trames(i+1,1))-chevauchement)<2/e_trame)
                                                           error('v_decoupe_xk'), end
  i=ceil(rand(1)*n_trame); j=ceil(rand(1)*e_trame);  
  if ~(min(abs(ech_trames(i,j)-t))<=1e-8)                       error('v_decoupe_xk'), end
  [~,n]=min(abs(ech_trames(i,j)-t));
  if ~(abs(x(n)-xk(i,j))<=1e-8)                        error('v_decoupe_xk'), end
  if ~(abs(ech_trames(1,1)-0)<=1e-8)                            error('v_decoupe_xk'), end
  if ~(ech_trames(end,end)<=e_x/fe)                             error('v_decoupe_xk'), end
  if ~(ech_trames(end,end)>e_x/fe-1.5*duree_trame-1e-8)             error('v_decoupe_xk'), end
  if ~(abs(centre_trames(i)-mean(ech_trames(i,:)))<=2/fe)             error('v_decoupe_xk'), end
  if e_trame<=1 return; end
  j=ceil(rand(1)*(e_trame-1));
  if ~(abs(ech_trames(i,j+1)-ech_trames(i,j)-1/fe)<=1e-8)            error('v_decoupe_xk'), end
  if n_trame<=1 return; end
end