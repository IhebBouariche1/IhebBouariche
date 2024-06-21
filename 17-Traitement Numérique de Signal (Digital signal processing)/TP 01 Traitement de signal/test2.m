% Spécifications du filtre passe-bande
fs = 1000; % Fréquence d'échantillonnage
f1 = 45;   % Fréquence de coupure inférieure
f2 = 55;  % Fréquence de coupure supérieure
[b, a] = butter(4, [f1, f2]/(fs/2), 'bandpass');

% Réponse en fréquence du filtre RII
freqz(b, a, 1024, fs);
