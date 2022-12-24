%  syms s; 
% G = tf([1],[1 1])
% figure(1)
% step(G)
% figure(2)
% bode(G)
% % L'ajout d'un Gain K 
% K = 10 ;
% F = tf(K*[1],[1 1])
% figure(4)
% step(F)
% figure(3)
% bode(F)
% 
% % L'ajout d'un retard 
% F = tf([1],[1 1],'IODelay',2)
% figure(5)
% step(F)
% figure(6)
% bode(F)
% 
% % L'ajout d'un retard et Gain 
% F = tf(10*[1],[1 1],'IODelay',2)
% figure(7)
% step(F)
% figure(8)
% bode(F)
% 
% % L'ajout d'un complexe 
% F = tf((5+10j)*[1],[1 1])
% figure(10)
% bode(F)