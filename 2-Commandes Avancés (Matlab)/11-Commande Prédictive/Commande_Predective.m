%Model en Boucle ouverte
clear all 
clc 
u(1)= 1; u(2)=1;  
y(1)=0 ; y(2)=0;
for k=3:1:100
    u(k) = 1;
    y(k) = 0.8*y(k-1) + 0.4*u(k-1) + 0.6*u(k-2);
end 
figure(1)
plot(1:1:100,y),axis([0 100 -10 10]);

%********************** La commande adaptative *********************
%1% Le calcul des parametres E(j) et F(j) (on a Nu=3 donc 1<=J<=3  j=1,2,3)
% E(1) = 1 , E(2) = 1.8 - 0.8*Z^(-1)
% E(2) = 1 + 1.8*z^(-1) , F(2) = 2.44 - 1.44*z^(-1)
% E(3) = 1 + 1.8*z^(-1) + 2.44*z^(-2) , F(3) = 2.952 - 1.952*z^(-1)
% G(j) = B * E(j)
% G(1) = 0.4 + 0.6*z^(-1) 
% G(2) = 0.4 + 1.32*z^(-1) + 1.08*z^(-2) 
% G(3) = 0.4 + 1.32*z^(-1) + 2.056*z^(-2) + 1.464*z^(-3)
% G=[0.4 0 0 ; 1.32 0.4 0 ; 2.056 1.32 0.4]
% On calcule la u=-H^(-1)*b =((G'*G + lambda*I)^(-1))*G 
%tq u = [u(t)-u(t-1)  ;  u(t+1)-u(t)  ;  u(t+2)-u(t+1)]          ]
% lambda = 0.8;
% D = ((G'*G + lambda*eye(3))^(-1))*G'
% U = D*(f-w) 

clear all 
clc 
u(1)= 0; u(2)=0;u(3) = 0;
u1(1)= 0; u1(3)=0;u1(4) = 0;
u2(1)= 0; u2(4)=0;u2(5) = 0;
y(1)=0 ; y(2)=0;y(3) = 0;
yr(1)=0 ; yr(2)=0;yr(3) = 0;
w(1:1:105) = 1;
G = [0.4 0 0; 1.32 0.4 0; 2.056 1.32 0.4];
lambda = 0.8;
for k=3:1:100
    F = [0.6*(u(k-1)-u(k-2))+1.8*yr(k)-0.8*yr(k-1);1.08*(u(k-1)-u(k-2))+2.44*yr(k)-1.44*yr(k-1);1.464*(u(k-1)-u(k-2))+2.952*yr(k)-1.952*yr(k-1)];
    deltaU = -(inv(G'*G + lambda*eye(3))*G')*(F-[w(k+1);w(k+2);w(k+3)]);
    u(k) = deltaU(1)+u(k-1);
    u1(k+1) = deltaU(2)+u1(k);    
    u2(k+2) = deltaU(3)+u2(k+1);
    Y = G*deltaU+F;
    y(k+1) = Y(1);
    y2(k+1+1) = Y(2);
    y3(k+1+2) = Y(3);
    e(k) = w(k)-y(k);
    yr(k+1) = 0.8*yr(k) + 0.6*u(k) + 0.4*u(k-1);
end 
figure(2)
subplot(111),plot(1:1:101,y,'--',1:1:102,y2,'--',1:1:103,y3,'--',1:1:101,yr),axis([1 30 0 1.5]),legend("reponse prédicté pour k+1", "reponse prédictée pour k+2", "réponse prédictée pour k+3","la sortie réel");
figure(3)
subplot(311),plot(1:1:100,u),axis([1 30 0 1.5]),legend("la commande");
subplot(312),plot(1:1:100,e),axis([1 30 0 1.5]),legend("l'erreur");
subplot(313),plot(1:1:101,yr),axis([1 30 0 1.5]),legend("la sortie réel");



