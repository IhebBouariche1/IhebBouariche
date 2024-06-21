clear all 
close all 
clc
% Paramètres du signal
Fs = 1000; % Fréquence d'échantillonnage
t = 0:1/Fs:249/1000; % Vecteur temps
fe = Fs
% Signal utile perturbé par la sinusoïde
xn = load('signalbase.mat').x;

% Signal sinusoïdal parasite
t_sin = t; % Vecteur temps pour la sinusoïde
f_sin = 50; % Fréquence de la sinusoïde
A_sin = 1.2; % Amplitude de la sinusoïde
sinusoid = A_sin * sin(2*pi*f_sin*t_sin);


% Ajout du bruit blanc centré de variance 0.5
bn = sqrt(0.5) * randn(size(t)); % Génération du bruit blanc
y2 = xn + bn + sinusoid; % Signal total perturbé


fc = 250;
frequence_normalise = fc/(fe/2);
% Question 07 et 08 
B = fir1(1,frequence_normalise,'low');
figure()
freqz(B,1,1000,fe)
signal = y2;
filtered_signal = filter(B, 1, signal);




% Spécifications du filtre
f0 = 50; % Fréquence caractéristique
bw = 10; % Largeur de bande
fs = 1000; % Fréquence d'échantillonnage

% Calcul des fréquences de coupure normalisées
f1 = (f0 - bw/2) / (fs/2); % Fréquence de coupure inférieure normalisée
f2 = (f0 + bw/2) / (fs/2); % Fréquence de coupure supérieure normalisée

% Création du filtre coupe-bande
order = 2; % Ordre du filtre (par exemple)

[b, a] = butter(order, [f1, f2], 'stop'); % Conception du filtre Butterworth

% Analyse de la réponse en fréquence
figure()
freqz(b, a);



y_filtre_cb_rif = filter(b, a, filtered_signal);


% Affichage des signaux filtrés
figure()
subplot(4,1,1);
plot(xn);
title("Signal d'origine");


subplot(4,1,2);
plot(y2);
title("Signal bruité");

subplot(4,1,3);
plot(filtered_signal);
title('Signal filtré par passe-bas');

subplot(4,1,4);
plot(y_filtre_cb_rif);
title('Signal filtré par passe-bande RIF');