%systeme échantillonné
Num = [0 0.4 0.8]
Den = [1 -1.7 0.72]
H = filt(Num,Den)
step(H)
% le cahier de charge
    % erreur statique nule et un comportement regulation (1 - 0.5z^(-1)).


%la resolution de l'equation diophantienne
P = conv(Den,[1 -0.5])
P(5) = 0
    % A(z) x S(z) + B(z) x R(z) x z^(-p)  =  P(z) % deg(P) = 4 
    % S(z) = Sp(z) x S1(z)      deg(S1) = 1    deg(R) = 2
    % on prend la matrice M represente les coefficients de chque degre de z
    % et X represent les inconues [1 s1 r0 r1 r2]'
    
M = [1 0 0 0 0 ; -2.7 1 0.4 0 0 ; 2.42 -2.7 0.8 0.4 0 ; -0.72 2.42 0 0.8 0.4 ; 0 -0.72 0 0 0.8]
X = inv(M) * P'
S = conv([1 -1],[1 0.3333])
R = [0.4167 -0.7083 0.3000]
    % T(z) = P(z) / B(1) 

    