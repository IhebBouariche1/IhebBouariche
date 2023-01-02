%%COMMANDE ADAPTATIVE MIT
clear all 
close all 
clc
% systeme en boucle ouverte 
y(1)=1;
y(2)=1;
y(3)=1;
ym(1)=2; 
ym(2)=2;
ym(3)=2;
r=ones(1,100);
a1 = -2;
a2 = -1 ;
b1 = 2 ;
b2 = 1 ;
b3 = 0.5;
for k=4:1:100
    y(k) = a1*y(k-1)+a2*y(k-2)+b1*r(k-1)+b2*r(k-2)+b3*r(k-3);
    ym(k) = ym(k-1)-0.25*ym(k-2)+r(k-1)+0.3*r(k-2);
end

% systeme en boucle fermé 
clear all 
close all 
clc
% systeme en boucle ouverte 
y(1)=1;
y(2)=1;
y(3)=1;
ym(1)=0; 
ym(2)=0;
ym(3)=0;
r=ones(1,1000);
a = -0.5; 
b = 0.7;
f(3) = 1; 
g(3) = 1; 
sigma = 0.1;
e(1) = 1;
e(2) = 1; 
e(3) = 1;
am = -0.1;
bm = 0.5;
for k=4:1:500
    u(k) = -f(k-1)*y(k-1) + g(k-1)*r(k-1)
    if k==250
        a=-0.2;
        b=0.5;
    end 
    y(k) = -a*y(k-1)+b*u(k-1); 
    ym(k) = -am*ym(k-1)+bm*r(k);
    e(k) = y(k) - ym(k) ;
    g(k) = (-am + 1)*g(k-1)+am*g(k-2)-sigma*r(k-2)*e(k-1);
    f(k) = (-am + 1)*f(k-1)+am*f(k-2)+sigma*y(k-2)*e(k-1); 
end
plot(0:1:499,ym,'r',0:1:499,y,'b'),legend('modèle de référence','modèle réel')