% Question 06   
close all 
clear all 
clc
load('signalbase.mat', 'x')
%Definition de la reponse frequentielle de signal x 
fe = 1000;               % sampling frequency
t = 0:(1/fe):(10-1/fe); % time vector
fe = 1e3;
y2 = x + 0.5*randn(1,length(x));
S = y2;
n = length(S);
X = fft(S);
f = (0:n-1)*(fe/n);     %frequency range 
fshift = (-n/2:n/2-1)*(fe/n); % zero-centered frequency range
figure()
plot(fshift,fftshift(abs(X)))
title("DSP de signal bruité")
grid on
%Definition du Filter
figure()    
fe = 1e3;
fc = 10;
y2 = x + 0.5*randn(1,length(x));
fr = [-fe/2,-fc,fe/2,fc];
Flt = zeros(1,250);
% ones = ones(1,50);
Flt((length(x)/2+1-fc/2:length(x)/2+fc/2))=ones(1,fc);
fftshift(Flt);
plot(fshift,Flt); 
title('réponse fréquencielle de filtre')
grid on 
% Filtrage 
figure()
X = fftshift(fft(y2)); 
FReponse = X.*Flt; 
plot(fshift,FReponse);
title('DSP filtré')
grid on 
% reponse en t 
tReponse1 = ifft(ifftshift(FReponse));
figure()
plot(abs(tReponse1));
title('réponse filtrée')
grid on

close all 
fc = 100;
frequence_normalise = fc/(fe/2);
% Question 07 et 08 
B = fir1(fc,frequence_normalise,'low');
figure()
freqz(B,1,1024,fe)
signal = y2;
filtered_signal = filter(B, 1, signal);
% Visualisation du signal d'origine et du signal filtré
figure();
subplot(2,1,1);
plot(signal);
title('Signal avec bruit (20 Hz) + Bruit aléatoire');
xlabel('Temps');
ylabel('Amplitude');

subplot(2,1,2);
plot(filtered_signal);
title('Signal filtré (fréquence de coupure à 50 Hz)');
xlabel('Temps');
ylabel('Amplitude');

% Question 09 
figure()
S = filter(B,[1],y2);
plot(S);
title('Plot 1');
xlabel('Time');
ylabel('Amplitude');
grid on 

%Question 10
%For data sampled at 1000 Hz, design a bandpass filter with passband 
%   of 60 Hz to 200 Hz, with less than 3 dB of ripple in the passband, 
%   and 40 dB attenuation in the stopbands that are 50 Hz wide on both 
%   sides of the passband.
 Wp = [.2 .7], Ws = [.1 .8] ;  % Normalizing frequency
Rp = 0.3; Rs = 15;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);  % Gives minimum order of filter
[z,p,k] = butter(n,Wn);         % Butterworth filter design
SOS = zp2sos(z,p,k);            % Converts to second order sections
freqz(SOS,1024,1000)            % Plots the frequency response




