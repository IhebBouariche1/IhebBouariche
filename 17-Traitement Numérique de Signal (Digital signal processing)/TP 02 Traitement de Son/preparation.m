function [xk,ech_trames,centres_trames]=preparation(x,fe,duree_trame,chevauchement)
  %cette fonction ressemble à decoupe_signal mais elle y rajoute 
  %la preparation des données. 
  [xk,ech_trames,centres_trames]=decoupe_signal(x,fe,duree_trame,chevauchement);
  fenetre=window(@hamming,length(xk(1,:)))'; S_fen=sum(fenetre);
  PMCT=zeros(size(xk,1),1);
  for k=1:size(xk,1)
    PMCT(k)=sum(xk(k,:).^2.*fenetre)/S_fen;
  end
  se=max(PMCT)/10;
  k_de=find(PMCT>=se,1,'first');
  k_fi=find(PMCT>=se,1,'last');
  xk=xk(k_de:k_fi,:); 
  P_xk=sum(sum(xk.^2))/size(xk,1)/size(xk,2);
  xk=xk/sqrt(P_xk);
  ech_trames=ech_trames(k_de:k_fi,:); 
  centres_trames=centres_trames(k_de:k_fi);
end