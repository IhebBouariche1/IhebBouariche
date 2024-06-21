clear all 
close all 
clc
% Paramètres du signal
Fs = 1000; % Fréquence d'échantillonnage
t = 0:1/Fs:249/1000; % Vecteur temps

% Signal utile perturbé par la sinusoïde
xn = load('signalbase.mat').x;

% Signal sinusoïdal parasite
t_sin = t; % Vecteur temps pour la sinusoïde
f_sin = 50; % Fréquence de la sinusoïde
A_sin = 1.2; % Amplitude de la sinusoïde
sinusoid = A_sin * sin(2*pi*f_sin*t_sin);


% Ajout du bruit blanc centré de variance 0.5
bn = sqrt(0.5) * randn(size(t)); % Génération du bruit blanc
yn = xn + bn + sinusoid; % Signal total perturbé


n = length(xn);
X = fft(yn); 
fshift = (-n/2:n/2-1)*(1000/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);


figure();
subplot(2,1,1);
plot(t, yn);
title('Signal perturbé yn');
xlabel('Temps');
ylabel('Amplitude');
grid on 
subplot(2,1,2);
plot(fshift, powershift);
title('DSP de yn');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
grid on 