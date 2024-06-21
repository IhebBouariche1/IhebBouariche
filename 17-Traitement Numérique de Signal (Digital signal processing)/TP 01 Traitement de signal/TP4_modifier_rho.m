function t=TP4_modifier_rho(t,rho)
%fonction actionné par l'utilisateur dans le cadre de TP4.m
  A=[1 -rho];
  B=1-rho; 
  t_=t.userData;
  fe=t_.fe;
  [H,F]=freqz(B,A,300,fe);
  H_fc=max(abs(H))/sqrt(2); [~,ind_fc]=min(abs(abs(H)-H_fc)); fc=F(ind_fc); H_fc=H(ind_fc);
  figure(1); subplot(313); plot(F,abs(H),[0 fc fc],[abs(H_fc) abs(H_fc) 0],'k:');
  t_.rho=rho;
  t.userData=t_;
end