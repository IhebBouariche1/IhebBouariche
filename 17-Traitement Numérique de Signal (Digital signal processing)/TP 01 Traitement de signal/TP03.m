% 01 
clear all 
clc 
close all 
load("signalbase.mat")
fe = 25 
Te = 1/fe;
T = 1/25:Te:length(x)/25;
figure()
% plot(l,Cm1)
grid on
hold on 
plot(T,x)

% La DSP de Sn
fe = 25;               % sampling frequency
t = 0:(1/fe):(10-1/fe); % time vector
S = x;
n = length(x);
X = fft(x); 
figure();%power
fshift = (-n/2:n/2-1)*(fe/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);
plot(fshift,powershift);
grid on

figure();%power
semilogx(fshift, powershift);
title('DSP de sn en fréquences centrées en Hertz');
xlabel('Fréquences (Hz)');
ylabel('DSP');
grid on;



% 02 
Te = 1/25;
fe = 25;
t = 1.3;
S = 0; 
for n = 1:1:length(x)
    S = S + x(n)*(sin(pi*(t-(n-1)*Te)*fe))/(pi*(t-(n-1)*Te)*fe);
end 
disp(S) 
% fe /2 on pourra prendre des frequences > a ça 

% 04 

vn = zeros(1,500); 
vn(1:2:500) = x; 
subplot(1,2,1)
plot(1:1:500,vn)
xlabel('Te');
ylabel('Vn');
title('la representation de Vn');
grid on 

% Subplot 2
subplot(1,2,2)
plot(1:1:250,x)
xlabel('Te');
ylabel('sn');
title('la representation de Sn');
grid on 

% La DSP de vn
fe = 50;               % sampling frequency
t = 0:(1/fe):(10-1/fe); % time vector
S = vn;
n = length(vn);
X = fft(vn);
figure();%power
fshift = (-n/2:n/2-1)*(fe/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);
plot(fshift,powershift);
grid on

figure();%power
semilogx(fshift, powershift);
title('DSP de sn en fréquences centrées en Hertz');
xlabel('Fréquences (Hz)');
ylabel('DSP');
grid on;

%La réponse fréquencielle de Filtre H1 
denominator = 1;
numerator = [1,1]; 
ts = 1/25; % Periode d'échantillonnage
Filter = filt(numerator,denominator,ts)
impulse(Filter)
title('réponse Impulsionelle de H1');
xlabel('Temps(s)');
ylabel('Amplitude');
grid on 
figure()
[H,W]=freqz(numerator,denominator,1000);
plot(W,H)
title('DSP de filtre H1');
xlabel('Fréquences');
ylabel('DSP');
grid on

%Filtrage de signal vn par le filtre H1 
y1 = filter(numerator,denominator,vn);
figure()
plot(t,y1)
title('Signal vn Filtré par le filtre H1 ');
xlabel('Temps(s)');
ylabel('Amplitude');
grid on 


%La réponse fréquencielle de Filtre H2
denominator = 1;
numerator = [1/2,1,1/2]; 
ts = 1/25; % Periode d'échantillonnage
Filter = filt(numerator,denominator,ts)
figure()
impulse(Filter)
title('réponse Impulsionelle de H2');
xlabel('Temps(s)');
ylabel('Amplitude');
grid on 
figure()
[H,W]=freqz(numerator,denominator,1000);
plot(W,H)
title('DSP de filtre H2');
xlabel('Fréquences');
ylabel('DSP');
grid on

%Filtrage de signal vn par le filtre H2 
y2 = filter(numerator,denominator,vn);
figure()
y3 = zeros(1,length(x));
for i = 2:2:length(y2)
y3(i/2) = y2(i);
end
t = 0:(1/25):(10-1/25);
plot(t,y3,t,x)
title('Signal vn Filtré par le filtre H2 ');
xlabel('Temps(s)');
ylabel('Amplitude');
legend("signal filtré","signal de sn")
grid on 