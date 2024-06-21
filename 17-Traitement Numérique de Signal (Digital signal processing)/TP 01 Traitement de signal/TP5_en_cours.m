function t=TP4_en_cours(t)
% Ce programme est appele par le timer 
% ET NON PAR L'UTILISATEUR.
% Il actualise les donnees dans userData et affiche la figure
% toc_ : instant d'échantillonnage le plus récent
% dt   : ensemble des instants rajoutes 
  t_=t.userData;
  toc_=floor(toc*t_.fe)/t_.fe;
  
  dt=t_.toc:1/(t_.fe):(toc_-1/(t_.fe));
  t_.x=[t_.x sin(2*pi*t_.f0*dt+pi/2)+0.3*randn(1,length(dt))]; 
  t_.t=[t_.t dt];
  t_.x=t_.x(t_.t>=toc_-t_.duree);
  t_.t=t_.t(t_.t>=toc_-t_.duree);
  t_.toc=toc_;
  t.userData=t_;
  ind=find(t_.t>=toc_-t_.delta_t,1,'first');  
  N=length(t_.t)-ind+1;
  ech_f=-t_.fe/2:(t_.fe)/N:(t_.fe/2-t_.fe/N);
  Sp=abs(fftshift(fft(t_.x(ind:end)))).^2/N^2; 
  ind=find(t_.t>=toc_-t_.visualisation,1,'first');  
  figure(1); 
  subplot(211); stem(t_.t(ind:end),t_.x(ind:end)); axis([toc_-t_.visualisation-1./t_.fe/2 toc_+1/t_.fe/2 -2.1 2.1]);
  subplot(212); plot(ech_f,10*log10(Sp),'.'); axis([-t_.fe/2 t_.fe/2 -50 0]);
end