clear all 
clc
close all 
%---------------------------------------------------------------------------------------
%%système désiré vs système réel
y(1)=1;
y(2)=1;
y(3)=1;
ym(1)=2; 
ym(2)=2;
ym(3)=2;
r=ones(1,100);
for k=4:1:100
    y(k) = -2*y(k-1)-y(k-2)+2*r(k-1)+r(k-2)+0.5*r(k-3);
    ym(k) = ym(k-1)-0.25*ym(k-2)+r(k-1)+0.3*r(k-2);
end
figure(1)
plot(0:1:99,ym,'r',0:1:99,y,'b'),axis([0 100 -10 10]),legend('modèle de référence','modèle réel')
%--------------------------------------------------------------------------------------
%%COMMANDE ADAPTATIVE HYPERSTABILITE AVEC DES PARAMETRES CONNUES.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Objectif: le systeme doit garantir une erreure entre y et ym qui tend vers zero
%asymptotiquement avec une dynamique de (1+0.5*z(-1)).
%Cela nous garantir une régulation contre les perturbation
%et poursuite du systeme désiré ym <==> dynamique eqivalente avec la dynamique ym.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------------
%%Reparamétristion de l'objectif

%on note e: L'erreur       P la dynamique d'élimination d'erreur
% e(k) = y(k) - ym(k) (en boucle ouverte sans commande u) 
% P = 1 + 0.5*q(-1) 

%Premierement on doit changer la representation de P pour qu'elle contienne les
%parametres de la dynamique du systeme réel A = 1 + a1*q(-1) + q2*q(-2)
% donc on a une equation de bezout qui resoudre ce problème
% P = 1 + 0.5 * q(-1) = A(q(-1)) * S(q(-1)) + q(-d) * R(q(-1))
% on cherche S(q(-1)) et R(q(-1))
% on sait que S0 = 1
RS=(inv([1 0 0 ; 2 1 0 ; 1 0 1]))*([1; 0.5; 0]);
S0=RS(1);R0=RS(2);R1=RS(3); 

%Deuxiement c'est d'ecrire P(q(-1)) * y(k+d) en fct de u(q(-1)) et y(q(-1))
% on générale on aura
%P(q-1)*y(k+d) = [b0, b0*s1+b1 , b0*s2+b1*s1+b2 .... ,r0,r1....] * [u(k);u(k-1)... ;y(k),y(k-1)...]
% dans cette example on a 
%P(q-1)*y(k+d) = [2, 1, 0.5, -1.5, -1]*[u(k),u(k-1),u(k-2),y(k),y(k-1)]

% Troisiement on definie l'objectif
% e = P^(-1) * [ym(q^(-1)) - y(q^(-1))] = 0 avec y(0)!=0 (en boucle fermé avec la commande u)

% Quatriement on sortira le u qui est l'entrée dans y(q^(-1))
% u(k) = ym(k+1) + 0.5*ym(k) - [1,0.5,-1.5,-1]*[u(k-1),u(k-2),y(k),y(k-1)]

yc = zeros(1,100);
yc(1)=1;
yc(2)=1;
yc(3)=1;
yc(4)=1;
u=zeros(1,100);
e=zeros(1,100);
for k=4:1:90
    yc(k) = -2*yc(k-1)-yc(k-2)+2*u(k-1)+u(k-2)+0.5*u(k-3);
    u(k) = (ym(k+1)+0.5*ym(k)-u(k-1)-0.5*u(k-2)+1.5*yc(k)+yc(k-1))/2;
    e(k) = ym(k) - yc(k);
end
figure(2)
subplot(211),plot(0:1:99,ym,'r',0:1:99,yc,'b'),axis([0 20 -10 10]),legend('modèle de référence','modèle réel'),title('modele commandé');
subplot(212),plot(0:1:99,e,'b'),axis([0 20 -10 10]),legend("l'erreur");
