function F0_ZCR=c_F0_ZCR(xk,fe)
[xk,ech_trames,centres_trames]=preparation(xk,fe,30e-3,0.25);
K=size(xk,1);
F0_ZCR=zeros(K,1);
fenetre=window(@hamming,length(xk(1,:)))';
for trame=1:K
Z=abs(sign(xk(trame,2:end))-sign(xk(trame,1:end-1)))/2;
F0_ZCR(trame)=mean(Z.*fenetre(1:end-1))*fe/2/mean(fenetre(1:end-1));
end
end

