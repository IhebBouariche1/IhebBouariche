%%%%%%%%%%%%%%%%%%%% Commande Par Mode Glissant %%%%%%%%%%%%%%%%%%%%%%%%%
% On a l'objectif de mettre le systeme en plan de glissement:           %
%  Tq: x2 = -alpha*x1 => dx2 = -alpha*x2 => S = x2 + alpha*x1           %
%  Pour garantir une convergence de x2 asymprotiquement vers zero       % 
%  Et on aussi x1 va tends vers zero aussi au point d'équilibre (0,0)   %
% 1) S=0 , x1 et x2 en plan de glissement on aura:                      %
%           =>  dx2 = -alpha*x2 = (-k/m)*x1-(c/m)*x2+(1/m)*u            %
%           =>      ue = -(alpha*x2)*m + k*x1 + c*x2                    %
%    Rq: dans ce cas on a dx2 = -alpha*dx1 cela ne veut dire pas que:   %
%          x2 = -alpha*x1 => donc x1 et x2 peut etre sont hors          %
%                         le plan de glissement.                        %
% 2) x1 et x2 hors le plan de glissement on doit garantir que           %
%    S=x2+alpha*x1 tends vers zero (on appliquant la loi de Lyaponov).  %
%    on prends la fonction candidate : V = (S^2)/2                      %
%      - V est positive pour tout S                                     %
%      - dV doit etre definie negative:                                 %
%    => dV = dS*S=((-k/m)*x1-(c/m)*x2+(1/m)*u+alpha*x2)*S               %
%      ** si S>0 , ((-k/m)*x1-(c/m)*x2+(1/m)*u+alpha*x2) doit etre < 0  %
%      ** si S<0 , ((-k/m)*x1-(c/m)*x2+(1/m)*u+alpha*x2) doit etre > 0  %
%    cela est vrais ssi on prends u = ue + uc = ue - K * sign(S)        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%Déclaration du système:%%%%%%%%%
% dx1 = x2                             %
% dx2 = (-k/m)*x1 - (c/m)*x2 + (1/m)*u %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%!!!!! U should run the simulink CmdParModeGlissant.slx 
km=1;m=2;c=0.5;
load("SimulinkData.mat")
% Transformation du continue vers le discret 
A = [0 1;-km/m -c/m]; 
B = [0; 1*m];
C = [1 0];
D = 0; 
Gc = ss(A,B,C,D);
[num,den] = ss2tf(A,B,C,D);
Gctf = tf(num,den);
Gdtf = c2d(Gctf,1);
[A,B,C,D] = tf2ss([0.8845 0.8127],[1 -1.355 0.7788]);
Gd = ss(A,B,C,D,1);

%%%%%%% Systeme en temps discret avec T=1 %%%%%%%%%%
% x1(k+1) = 1.355*x1(k) + -0.7788*x2(k) + u(k)     %
% x2(k+2) = x1(k)                                  %
% y(k+1) = 0.8845*x1(k) + 0.8127*x2(k)             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x1(1) = 1; x2(1) = 0; 
u = zeros(1,1000);
y(1) = 0;
%Systeme en boucle ouverte
for k=1:1:1000
   x1(k+1) = 1.355*x1(k) - 0.7788*x2(k) + u(k);     %
   x2(k+1) = x1(k);                                  %
   y(k+1) = x1(k);  
end
figure(1)
subplot(313),plot(0:1:1000,y,'r'),grid on,axis([0 88 -2 2]),legend("Reponse du systeme");
subplot(311),plot(0:1:1000,x1,'b'),grid on,axis([0 88 -2 2]),legend("Reponse du X1");
subplot(312),plot(0:1:1000,x2,'g'),grid on,axis([0 88 -2 2]),legend("Reponse du X2");
figure(2) 
plot(x1,x2),xlabel("x1"),ylabel("x2"),grid on,legend("plan de phase");

%Systeme commandé par la commande Mode Glissant sinusoidale on evitant le
%phénomene de chattening
figure(3)
subplot(311),plot(1:0.1:101,out.X1.signals.values,'r'),grid on,axis([1 88 -2 2]),legend("Réponse du X1 commandé");
subplot(312),plot(1:0.1:101,out.X2.signals.values,'b'),grid on,axis([1 88 -2 2]),legend("Reponse du X2 commandé");
subplot(313),plot(1:0.1:101,out.Cmd.signals.values,'g'),grid on,axis([1 88 -2 2]),legend("Signal de commande");
figure(4) 
v = 0:1:100;
plot(out.X1.signals.values,out.X2.signals.values,v,-2*v),xlabel("x1"),ylabel("x2"),...
    grid on,axis([0 2 -2 2]),legend("plan de phase sous l'effet de la commande");