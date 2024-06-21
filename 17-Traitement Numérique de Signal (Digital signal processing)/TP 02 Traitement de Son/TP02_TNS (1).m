clear all 
close all 
clc 

% Premiere partie
%%%%%%%%%%% I.e %%%%%%%%%%%% 
a=2;  
f0=50; 
fe=75;   
tn=0:1/fe:(100e-3-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure()
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal èantionn0ar une fruence de 500Hz')
grid on


fs = 500;               % sampling frequency
t = 0:(1/fs):(10-1/fs); % time vector
S = xn;
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range 
figure();%power
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);% zero-centered power
plot(fshift,powershift)
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% le cas de 0.5
bn1 = square(0.5)*randn(1,length(tn));
yn1 = bn1 + xn;
% le cas de 2
bn2 = square(2)*randn(1,length(tn));
yn2 = bn2 + xn;
% le cas de 5
bn3 = square(5)*randn(1,length(tn));
yn3 = bn3 + xn;




% Deuxieme partie
L = 40; 
[Cb1,LAGSb1] = xcorr(bn1,bn1,L);
[Cy1,LAGSy1] = xcorr(yn1,yn1,L);
[Cb2,LAGSb2] = xcorr(bn2,bn2,L);
[Cy2,LAGSy2] = xcorr(yn2,yn2,L);
[Cb3,LAGSb3] = xcorr(bn3,bn3,L);
[Cy3,LAGSy3] = xcorr(yn3,yn3,L);
[Cx,LAGSx] = xcorr(xn,xn,L);

% affichage des graphes
% pour Cx
figure()
l = -(length(Cx)-1)/2:1:(length(Cx)-1)/2;
plot(l,Cx)
title("l'autocorelation pour xn")
grid on 
hold off
% Pour Cb 
figure()
plot(l,Cb1)
hold on
plot(l,Cb2)
plot(l,Cb3)
grid on 
title("l'autocorelation pour bn")
legend("sigma = 0.5","sigma = 2","sigma = 5")
% Pour Cy 
figure()
plot(l,Cy1)
hold on
plot(l,Cy2)
plot(l,Cy3)
title("l'autocorelation pour yn")
legend("sigma = 0.5","sigma = 2","sigma = 5")
grid on 

% la fruence d'èantillonage a un effet direct sur l'autocorelation.

% II.3.
m1 = randn(1,50);
m2 = sin(2*pi*(1:50)*0.1);
m3 = sin(2*pi*(1:50)*0.1).*exp(-(-24:25).^2/10^2);

[Cm1,LAGSm1] = xcorr(m1,m1,L);
[Cm2,LAGSm2] = xcorr(m2,m2,L);
[Cm3,LAGSm3] = xcorr(m3,m3,L);
figure()
plot(l,Cm1)
grid on
title("l'autocorelation pour la fonction randn")
figure()
plot(l,Cm2)
grid on
title("l'autocorelation pour la fonction sinus")
figure()
plot(l,Cm3)
grid on
title("l'autocorelation pour la fonction sinuso% modul`par une gaussienne")

% II.4 
m4 = [m1,zeros(1,50),m1,zeros(1,100),m1];
figure()
plot(0:1:length(m4)-1,m4);
grid on
title("Le signal re`par le radar sans bruit")


m5 = m4 + 0.1*randn(1,length(m4));
figure()
plot(0:1:length(m5)-1,m5);
grid on
title("Le signal re`par le radar bruit")

% II.5
[Cm4,LAGSm5] = xcorr(m5,m4);
figure()
% plot(l,Cm1)
grid on
hold on 
plot(-299:1:299,Cm4)
% legend("Autocorellation du bruit blanc","Autocorellation du bruit blanc de longueur 300")
title("l'autocorelation entre le signal motif et le signal bruit©



% II.5 
m4 = [m1,zeros(1,50),m1,zeros(1,100),m1];
figure()
plot(0:1:length(m4)-1,m4);
grid on
title("Le signal re`par le radar sans bruit")


m5 = m4 + 2*randn(1,length(m4));
figure()
plot(0:1:length(m5)-1,m5);
grid on
title("Le signal re`par le radar bruit")

% II.5
[Cm4,] = xcorr(m5,m4);
figure()
% plot(l,Cm1)
grid on
hold on 
plot(-299:1:299,Cm4)
% legend("Autocorellation du bruit blanc","Autocorellation du bruit blanc de longueur 300")
title("l'autocorelation entre le signal motif et le signal bruit©



% le scan du signal 
m4 = [m1,zeros(1,50),m1,zeros(1,100),m1];
m5 = m4 + 0.1*randn(1,length(m4));
[Cm5,] = xcorr(m5,m1);
figure()
% plot(l,Cm1)
grid on
hold on 
plot(-299:1:299,Cm5)
% legend("Autocorellation du bruit blanc","Autocorellation du bruit blanc de longueur 300")
title("l'autocorelation entre le signal motif et le signal bruit©
