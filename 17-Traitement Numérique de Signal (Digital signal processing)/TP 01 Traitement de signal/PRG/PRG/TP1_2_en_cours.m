function t=TP1_2_en_cours(t)
% Ce programme est appele par le timer 
% ET NON PAR L'UTILISATEUR.
% Il actualise les donnees dans userData et affiche la figure
% toc_ : instant d'échantillonnage le plus récent
% dt   : ensemble des instants rajoutes 
  t_=t.userData;
  toc_=floor(toc*t_.fe)/t_.fe;
  
  dt=t_.toc:1/(t_.fe):(toc_-1/(t_.fe));
  t_.x=[t_.x 2*sin(2*pi*t_.f0*dt+pi/2)]; 
  t_.t=[t_.t dt];
  t_.x=t_.x(t_.t>=toc_-t_.duree);
  t_.t=t_.t(t_.t>=toc_-t_.duree);
  t_.toc=toc_;
  
  t.userData=t_;
  figure(1); stem(t_.t,t_.x); axis([toc_-t_.duree-1./t_.fe/2 toc_+1/t_.fe/2 -2.1 2.1]);
end