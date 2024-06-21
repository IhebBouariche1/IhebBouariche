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

clear all 
close all 
clc 

load('signalbase.mat', 'x')
y1 = x + 0.1*randn(1,length(x));
y2 = x + 0.5*randn(1,length(x));
y3 = x + 1*randn(1,length(x));
y4 = x + 2*randn(1,length(x)); 
b1 = 0.1*randn(1,length(x));
b2 = 0.5*randn(1,length(x));
b3 = randn(1,length(x));
b4 = 2*randn(1,length(x));
figure()
% First subplot
subplot(2, 2, 1);
plot(y1);
title('Signal bruité de valeur σ = 1/10');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Second subplot
subplot(2, 2, 2);
plot(y2);
title('Signal bruité de valeur σ = 1/2');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Third subplot
subplot(2, 2, 3);
plot(y3);
title('Signal bruité de valeur σ = 1');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Fourth subplot
subplot(2, 2, 4);
plot(y4);
title('Signal bruité de valeur σ = 2');
xlabel('Time');
ylabel('Amplitude');
grid on 

% La DSP de Sn
fe = 25;               % sampling frequency
t = 0:(1/fe):(10-1/fe); % time vector
load("signalbase.mat")
n = length(x);
X = fft(x); 
figure();%power
fshift = (-n/2:n/2-1)*(fe/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);
plot(fshift,powershift);
title("DSP de x")
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure()
% First subplot
subplot(2, 2, 1);
plot(fshift,fftshift(abs(fft(b1)).^2/n));
title('DSP de Bruit de σ = 1/10');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Second subplot
subplot(2, 2, 2);
plot(fshift,fftshift(abs(fft(b2)).^2/n));
title('DSP de Bruit de σ = 1/2');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Third subplot
subplot(2, 2, 3);
plot(fshift,fftshift(abs(fft(b3)).^2/n));
title('DSP de Bruit de σ = 1');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Fourth subplot
subplot(2, 2, 4);
plot(fshift,fftshift(abs(fft(b4)).^2/n));
title('DSP de Bruit de σ = 2');
xlabel('Time');
ylabel('Amplitude');
grid on 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Le rapport RSB: 
power_x = mean(abs(x).^2);
power_b1 = mean(abs(b1).^2);
snr = power_x / power_b1;
snr_db1 = 10 * log10(snr)

power_x = mean(abs(x).^2);
power_b2 = mean(abs(b2).^2);
snr = power_x / power_b2;
snr_db2 = 10 * log10(snr)
 
power_x = mean(abs(x).^2);
power_b3 = mean(abs(b3).^2);
snr = power_x / power_b3;
snr_db3 = 10 * log10(snr)

power_x = mean(abs(x).^2);
power_b4 = mean(abs(b4).^2);
snr = power_x / power_b4;
snr_db4 = 10 * log10(snr)

%11 
fe = 2;
P = 2;
B = (1/P)*ones(1,P);
A = [1];
Filter = filt(B,A,1/fe)
figure()
impulse(Filter)
title('réponse Impulsionelle du filtre pour P = 2 ');
xlabel('Temps(s)');
ylabel('Amplitude');
grid on 
figure()
[H,W]=freqz(B,A,1000);
plot(W,H)
title('DSP de filtre pour P = 2');
xlabel('Fréquences');
ylabel('DSP');
grid on

% fe = 2;
% P = 10;
% B = (1/P)*ones(1,P);
% A = [1];
% Filter = filt(B,A,1/fe)
% figure()
% impulse(Filter)
% title('réponse Impulsionelle du filtre pour P = 10 ');
% xlabel('Temps(s)');
% ylabel('Amplitude');
% grid on
% figure()
% [H,W]=freqz(B,A,1000);
% plot(W,H)
% title('DSP de filtre pour P = 10');
% xlabel('Fréquences');
% ylabel('DSP');
% grid on


[h,f] = freqz(B,A,1000,fe);
S1 = filter(B,A,y1);
S2 = filter(B,A,y2);
S3 = filter(B,A,y3);
S4 = filter(B,A,y4);
figure()
plot(f,h)
% First subplot
subplot(2, 2, 1);
plot(S1);
title('signal filtré le cas de σ = 1/10');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Second subplot
subplot(2, 2, 2);
plot(S2);
title('signal filtré le cas de σ = 1/2');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Third subplot
subplot(2, 2, 3);
plot(S3);
title('signal filtré le cas de σ = 1');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Fourth subplot
subplot(2, 2, 4);
plot(S4);
title('signal filtré le cas de σ = 2');
xlabel('Time');
ylabel('Amplitude');
grid on 
figure()
plot(f,h)
grid on 

% 15 
load('signalbase.mat', 'x')
y1 = x + 0.1*randn(1,length(x));
y2 = x + 0.5*randn(1,length(x));
y3 = x + 1*randn(1,length(x));
y4 = x + 2*randn(1,length(x)); 

close all 

fe = 2;
B = [1];
A = [2,-1];
figure()
impz(A,B)
grid on
[h,f] = freqz(B,A,1000,fe);
S1 = filter(B,A,y1);
S2 = filter(B,A,y2);
S3 = filter(B,A,y3);
S4 = filter(B,A,y4);
figure()
plot(f,abs(h))
% First subplot
subplot(2, 2, 1);
plot(S1);
title('Plot 1');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Second subplot
subplot(2, 2, 2);
plot(S2);
title('Plot 2');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Third subplot
subplot(2, 2, 3);
plot(S3);
title('Plot 3');
xlabel('Time');
ylabel('Amplitude');
grid on 
% Fourth subplot
subplot(2, 2, 4);
plot(S4);
title('Plot 4');
xlabel('Time');
ylabel('Amplitude');
grid on 
figure()
plot(f,h)
grid on 


figure()
% First subplot
subplot(1, 2, 1);
plot(y1);
title('signal bruité pour le cas de σ = 1/2');
xlabel('Time');
ylabel('Amplitude');
grid on 
subplot(1, 2, 2);
plot(S1);
title('Signal filtrée pour le cas de σ = 1/2');
xlabel('Time');
ylabel('Amplitude');
grid on 




