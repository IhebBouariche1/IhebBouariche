% t=TP1_2(0.1,2,10,0.5);
% start(t);

clear all 
clc 
close all 
%%%%%%%%%%%%%%%%%%%% I.3. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% pour fe = 75Hz
a=2;  
f0=50; 
fe=75; 
tn=0:1/fe:(100e-3-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure(1); 
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 75Hz')
grid on

% pour fe = 150Hz
a=2;  
f0=50; 
fe=150; 
tn=0:1/fe:(0.1-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure(2); 
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 150Hz')
grid on

% pour fe = 1KHz
a=2;  
f0=50; 
fe=1e3; 
tn=0:1/fe:(100e-3-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure(3); 
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 1KHz')
grid on


%%%%%%%%%%%%%%%% I.4 %%%%%%%%%%%%%%%%%%%%%
a=2;  
f0=50; 
fe=500;
Nq = 2^8
tn=0:1/fe:(40e-3-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure(4); 
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title("Signal échantionné et quantifié d'une fréquence de 500Hz et sur 8 bits")
fprintf("la valeur du pas de quantication = %f \n", a*2/Nq)
grid on

b=3;
Q=2*a/(2^b);
xq=(floor(xn/Q)+0.5)*Q;
figure(5); 
plot(tn,xn,tn,xq);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title("Signal échantionné vs signal quantifié")
grid on

err=mean(abs(xn-xq));
fprintf("l'erreur de quantification = %f \n", err)
fprintf("l'erreur de quantification varie en fonction de variantion de buffer. Si on augmente le nombre de buffer on aura plus de précision \n")


a=2; f0=50; fe=500; tn=0:1/fe:(40e-3-1/fe); xn=a*sin(2*pi*f0*tn+pi/2);
b_l=1:12;
Q_l=2*a./(2.^b_l);
err_l=zeros(size(b_l));
for Q_=1:length(Q_l)
  Q=Q_l(Q_);
  xq=(floor(xn/Q)+0.5)*Q;
  err_l(Q_)=mean(abs(xn-xq));
end
figure(6); semilogy(b_l,err_l);
xlabel('Temps(s)')
ylabel('Erreur')
title("L'erreur moyenne de quantication")
grid on

%%%%%%%%%%%%% 1.5 %%%%%%%%%%%%%%%
Xf= fft(xn);
n = length(xn);          % number of samples
f = (0:n-1)*(fe/n);     % frequency range
power = abs(Xf).^2/n;
figure(7)
plot(f,abs(power));
grid on 

%%%%%%%%%%%%% 1.6 %%%%%%%%%%%%%%%%%%%
a=2;  
f0=50; 
fe=100.2; 
tn=0:1/fe:(3-1/fe); 
xn=a*sin(2*pi*f0*tn+pi/2);
figure(8); 
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 100.2Hz')
grid on
%Commentaire: 
fprintf("On remarque qu'on a eu une partie de signal et ça c'est parceque on a une petite frequence d'echantionnage et ça peut etre vérifie par le theoreme de shannon \n")

%%%%%%%%%%%%% 1.7 %%%%%%%%%%%%%%%%%%%
feShannon = f0*2;
fprintf("La valeur de la frequence d'échantionnage doit etre superieur a la valeur de la fréquence de shannon: fe = %f > %f \n",fe,feShannon)

%%%%%%%%%%%%% 1.8 %%%%%%%%%%%%%%%%%%
Xf= fft(xn);
n = length(xn);          % number of samples
f = (0:n-1)*(fe/n);     % frequency range
power = abs(Xf).^2/n;
figure(9)
plot(f,abs(power));
grid on 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% I.d %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% t=TP1_2(0.57,2,200,0.5);
% start(t)

%%%%%%%%%%% I.e %%%%%%%%%%%% 
f0=50;
fe = 500;
tn=0:1/fe:(40e-3-1/fe);
xn=square(pi*2*f0*tn);
figure(10)
stem(tn,xn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 500Hz')
grid on


fs = 500;               % sampling frequency
t = 0:(1/fs):(10-1/fs); % time vector
S = xn;
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range 
figure(11);%power
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);% zero-centered power
plot(fshift,powershift)
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% I.f %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yn = square(0.3)*randn(1,length(tn))+ xn;      %%%% attention le xn c'est le signal sinusiodal
figure(12)  
stem(tn,yn);
xlabel('Temps(s)')
ylabel('Amplitude(u.a)')
title('Signal échantionné par une fréquence de 500Hz')
grid on

fs = 500;               % sampling frequency
t = 0:(1/fs):(10-1/fs); % time vector
S = yn;
n = length(S);
X = fft(S);
f = (0:n-1)*(fs/n);     %frequency range 
figure(13);%power
fshift = (-n/2:n/2-1)*(fs/n); % zero-centered frequency range
powershift = abs(X).^2/n;
powershift = fftshift(powershift);% zero-centered power
plot(fshift,powershift)
grid on



