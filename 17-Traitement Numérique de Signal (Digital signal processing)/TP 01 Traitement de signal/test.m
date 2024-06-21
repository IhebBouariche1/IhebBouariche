% Spécifications du filtre
f0 = 50; % Fréquence caractéristique
bw = 10; % Largeur de bande
fs = 1000; % Fréquence d'échantillonnage

% Calcul des fréquences de coupure normalisées
f1 = (f0 - bw/2) / (fs/2); % Fréquence de coupure inférieure normalisée
f2 = (f0 + bw/2) / (fs/2); % Fréquence de coupure supérieure normalisée

% Création du filtre coupe-bande
order = 4; % Ordre du filtre (par exemple)

[b, a] = butter(order, [f1, f2], 'stop'); % Conception du filtre Butterworth

% Analyse de la réponse en fréquence
freqz(b, a);

