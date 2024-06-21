function val=traitement(xk,nom_traitement,fe)
  if ~(size(xk,1)==1)                                      error('xk doit etre une seule trame'), end
  NK=length(xk);
  fenetre=window(@hamming,NK)';
  switch(nom_traitement)
    case 'F0_ZCR'
      Z=abs(sign(xk(2:end))-sign(xk(1:end-1)))/2;
      val=mean(Z.*fenetre(1:end-1))*fe/2/mean(fenetre(1:end-1));
    case 'SPC'
      Xk=fft(fenetre.*xk); k_l=1:floor(NK/2); Xk=Xk(k_l); 
      val=fe/NK*sum(abs(Xk).^2.*k_l)/sum(abs(Xk.^2));
    case 'SPW'
      Xk=fft(fenetre.*xk); k_l=1:floor(NK/2); Xk=Xk(k_l); 
      spc=fe/NK*sum(abs(Xk).^2.*k_l)/sum(abs(Xk.^2));
      val=sum(abs(Xk).^2.*abs(k_l*fe/NK-spc))/sum(abs(Xk).^2);
    case 'EM'
      val=mean(fenetre.*xk.^2)/mean(fenetre);
    case 'AM'
      val=mean(fenetre.*abs(xk))/mean(fenetre);
    otherwise 
      disp('nom_traitement inconnu')
      val=Nan;
end