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
for k=4:1:99
    y(k) = -2*y(k-1)-y(k-2)+2*r(k-1)+r(k-2)+0.5*r(k-3);
    ym(k) = ym(k-1)-0.25*ym(k-2)+r(k-1)+0.3*r(k-2);
end
%figure(1)
%plot(0:1:99,ym,'r',0:1:99,y,'b'),axis([0 100 -10 10]),legend('modèle de référence','modèle réel')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%commande adaptative (Hyperstabilité) parametres inconnues
yc(1)=1;
yc(2)=1;
yc(3)=1;
yc(4)=1;
r=ones(1,100);
u=zeros(1,100);
e=zeros(1,100);
F0 = (1/(10e-3))*eye(5);
phi0 = [0; 0; 0; 0; 0];
T0 = [1;0;0;-1;-1];
a1=2; a2=1; b1=2; b2=1; b3=0.5; 
for k=4:1:98
    EE(k) = yc(k) + 0.5*yc(k-1)-(T0)'*phi0;
    E(k) = EE(k)/(1+(phi0)'*F0*phi0);
    T = T0+F0*phi0*E(k)
    F = inv(0.8*inv(F0)+0.7*phi0*(phi0)');
    u(k) = (ym(k+1)+0.5*ym(k)-T(2)*u(k-1)-T(3)*u(k-2)-T(4)*yc(k)-T(5)*yc(k-1))/T(1);
    if k==50
        a1=2.05;
        a2=1.1;
    end
    yc(k+1) = -a1*yc(k)-a2*yc(k-1)+2*u(k)+u(k-1)+0.5*u(k-2);
    e(k) = ym(k) - yc(k);
    T0 = T ;
    F0 = F ;
    phi0 = [u(k) ; u(k-1) ; u(k-2) ; yc(k) ; yc(k-1)];
end
figure(1)
plot(0:1:98,ym,'r',0:1:98,yc,'b'),legend('modèle de référence','modèle réel')
