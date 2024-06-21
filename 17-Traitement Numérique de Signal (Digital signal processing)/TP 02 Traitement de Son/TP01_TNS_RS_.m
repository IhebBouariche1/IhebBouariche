% I.c deuxieme partie
clear all 
close all 
clc 

duree=2; 
fe=44100; 
t=0:1/fe:(duree-1/fe);
fs = 440; 

xs = sin(2*pi*fs*t); 

fm = 150;
xm = cos(2*pi*fm*t);

y1 = xs.*xm; 
figure()
plot(y1) 
grid on 

N=1000;
A=[0.5,0.5];
wn = 440/(fe/2);
B=fir1(N,wn,'high');
y2=filter(B,A,y1);
figure()
plot(y2)
grid on
sound(y2,fe);


S= y1;
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range 
figure();%power
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);% zero-centered power
plot(fshift,powershift)
grid on


S= y2;
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range 
figure();%power
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);% zero-centered power
plot(fshift,powershift)
grid on


% I.d ) 
y2 = sous_ech(y1,fe);
figure()
stem(y2)
grid on
