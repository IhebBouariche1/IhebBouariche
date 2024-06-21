% t=TP4()
% t=TP4_modifier_rho(t,0.85);
% 1) 
% N = 1000;
% fe = 2;
% phi = 0.65;
% A = [1-phi];
% B = [1,-phi];
% [H,F]=freqz(B,A,N,fe);
% S = filter(B,A,yn1);
% t = 1:1:250;
% figure()
% plot(1:1:250,x)
% grid on 
load('signalbase.mat', 'x')

figure()
y1 = x + 0.1*randn(1,length(x));
plot(y1)
grid on 

figure()
y2 = x + 0.5*randn(1,length(x));
plot(y2)
grid on 

figure()
y3 = x + 1*randn(1,length(x));
plot(y3)
grid on 

figure()
y3 = x + 2*randn(1,length(x));
plot(y3)
grid on 

b = 0.1*randn(1,length(x));

%Le rapport RSB: 
power_x = mean(abs(x).^2);
power_b = mean(abs(b).^2);
% Calcul du rapport signal sur bruit (RSB) en utilisant les puissances calculées.
snr = power_x / power_b;

% Calcul du RSB en dB.
snr_db = 10 * log10(snr);
