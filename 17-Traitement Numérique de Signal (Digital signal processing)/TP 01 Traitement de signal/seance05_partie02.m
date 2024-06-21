% Spécifications du filtre
Rp = 3;  % Gain en dB de la partie passante
Rs = 15;  % Gain en dB de la partie non-passante
fc = 50;  % Fréquence de coupure en Hz
fa = 60;  % Fréquence d'atténuation en Hz

% Calcul de l'ordre optimal du filtre de Butterworth
[N, Wn] = buttord(fc, fa, Rp, Rs, 's');
disp(['Ordre optimal du filtre : ', num2str(N)]);
disp(['Fréquence de coupure normalisée : ', num2str(Wn)]);
