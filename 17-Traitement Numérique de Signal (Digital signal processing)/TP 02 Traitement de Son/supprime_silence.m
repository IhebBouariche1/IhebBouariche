function [xk,ech_trames,centres_trames]=supprime_silence(xk,ech_trames,centres_trames)
signal = s_c_PMCT(xk);
PMCT = signal;
t=0:3/(length(PMCT)):3-1/length(PMCT);
t_=0:3/(length(xk)):3-1/length(xk);
seuil = 0.1

% Trouver les indices où le signal dépasse le seuil
indices = find(signal > seuil * max(signal));

length(t)
length(t_)

figure;
round(indices(1)*1323/127)
round(indices(end)*1323/127)
xk = xk(round(indices(1)*1323/127):round(indices(end)*1323/127))

plot(t_(round(indices(1)*1323/127):round(indices(end)*1323/127)),xk, 'b', 'LineWidth', 2);
grid on
end

