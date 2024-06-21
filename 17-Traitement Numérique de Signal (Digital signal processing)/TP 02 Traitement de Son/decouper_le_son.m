clear all 
clc 
close all

fs = 10; 
duree=1;
fe = 1e3;
t=0:1/fe:(duree-1/fe);
x = sin(2*pi*fs*t); 
figure()
plot(x) 
grid on 
title("Signal sinusiode de 10 Hz")
y = zeros(10,100);
for i=1:1:10
    for k=1:1:100
    y(i,k) = x(k*i);
    end 
end

figure()
duree_trame = 0.1;
% On utilise les fonction 
[xk,ech_trames,centres_trames] = decoupe_signal(x,1e3,duree_trame,0);
visualisation(x,fe,duree_trame,xk,ech_trames,centres_trames)


% avec un chevauchement de 25% 
[xk,ech_trames,centres_trames] = decoupe_signal(x,1e3,duree_trame,0.25);
visualisation(x,fe,duree_trame,xk,ech_trames,centres_trames)

% % Pour un signal de fe = 8Khz (essaie d'autres parametres pour avoire la
% % figure
% fs = 10; 
% duree=1;
% fe = 8e3;
% t=0:1/fe:(duree-1/fe);
% x = sin(2*pi*fs*t); 
% duree_trame = 0.1
% [xk,ech_trames,centres_trames] = decoupe_signal(x,8e3,duree_trame,0);
% visualisation(x,fe,duree_trame,xk,ech_trames,centres_trames)


