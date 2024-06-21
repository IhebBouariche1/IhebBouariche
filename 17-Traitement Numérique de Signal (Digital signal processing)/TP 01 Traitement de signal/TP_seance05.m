% Question 06   
close all 
clear all 
clc
load('signalbase.mat', 'x')
%Definition de la reponse frequentielle de signal x 
fe = 1000;               % sampling frequency
y2 = x + 0.5*randn(1,length(x));
fc = 10;
frequence_normalise = fc/(fe/2);
% Question 07 et 08 
B = fir1(1,frequence_normalise,'low');
figure()
freqz(B,1,1000,fe)
signal = y2;
filtered_signal = filter(B, 1, signal);
% Visualisation du signal d'origine et du signal filtré
figure();
subplot(2,1,1);
plot(signal);
title('Signal avec bruit');
xlabel('Temps');
ylabel('Amplitude');
grid on
subplot(2,1,2);
plot(filtered_signal);
title('Signal filtré (fréquence de coupure à 50 Hz)');
xlabel('Temps');
ylabel('Amplitude');
grid on 