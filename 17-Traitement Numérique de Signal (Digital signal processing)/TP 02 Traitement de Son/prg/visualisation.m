function visualisation(x,fe,duree_trame,xk,ech_trames,centres_trames)
  Te=1/fe;
  K=size(xk,1);
  NK=size(xk,2);
  t=0:Te:(length(x)-1)*Te;
  figure(1); plot(t,x); 
  figure(2); plot(ech_trames',xk');
  [m_t,m_n]=meshgrid((1:NK)/fe,1:K);
  figure(3); waterfall(m_t,m_n,xk)
  figure(4); plot([centres_trames(:)'-duree_trame/2; centres_trames(:)'+duree_trame/2],[1;1]*(1:K)/K,t,x,'k-');
end