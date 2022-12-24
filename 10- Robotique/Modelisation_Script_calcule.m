syms th1 th2 th3 th4 th5 th6 th7 d1 d2 d3 d4 d5 d6 d7 real
% th1 = 0
% th2 = 0
% th3 = 0
% th4 = 0
% th5 = 0
% th6 = 0
% th7 = 0

%i %theta %di %ai %alphai
%1 th1    0    0    pi/2
%2 th2    0    0   -pi/2
%3 th3    d1   0   -pi/2
%4 th4    0    0    pi/2
%5 th5    d2   0    pi/2
%6 th6    0    0   -pi/2
%7 th7    0    0     0
%d1 = 0.42m
%d2 = 0.40m
% mass in kg of each link
m1=4
m2=4 
m3=3 
m4=2.7 
m5=1.7000 
m6=1.8000 
m7=0.3000

%Position of the centre of mass for each link relative to body frame(revolute frame) !!!!
a1c = [0 -0.03 0.12 1]'
a2c = [0.0003 0.059 0.042 1]'
a3c = [0 0.03 0.13 1]'
a4c = [0 0.067 0.034 1]'
a5c = [0.0001 0.021 0.076 1]'
a6c = [0 0.6*1.0e-03 0.4*1.0e-03 1]'
a7c = [0 0 0.02 1]'

%Inertia Matrix for each link relative to center of mass !!!!!!
%[Ixx Ixy Ixz;Iyx Iyy Iyz;Izx Izy Izz]
% eroor bc i'm using inertia relative to revolute frame !!!  
I1 = [0.1612 0 0;0 0.1476 0.0144 ; 0 0.0144 0.0236]
I2 = [0.0710  -0.0001 -0.0001;-0.0001 0.0251 -0.0099;-0.0001   -0.0099    0.0579]
I3 = [0.1334         0         0;     0    0.1257   -0.0117;     0   -0.0117    0.0127]
I4 = [0.0452         0         0;     0    0.0131   -0.0062;      0   -0.0062    0.0411]
I5 = [0.0306   -0.0000   -0.0000; -0.0000    0.0278   -0.0027;-0.0000   -0.0027    0.0057]
I6 = [0.0050         0         0;     0    0.0036   -0.0000;     0   -0.0000    0.0047]
I7 = [0.0011         0         0;     0    0.0011         0;      0         0    0.0010]

%Transformation matrices
T01 = [cosd(th1) -sind(th1)*cosd(90) sind(th1)*sind(90) 0;sind(th1) cosd(th1)*cosd(90) -cosd(th1)*sind(90) 0;0 sind(90) cosd(90) 0;0 0 0 1];
T12 = [cosd(th2) -sind(th2)*cosd(-90) sind(th2)*sind(-90) 0;sind(th2) cosd(th2)*cosd(-90) -cosd(th2)*sind(-90) 0;0 sind(-90) cosd(-90) 0;0 0 0 1];
T23 = [cosd(th3) -sind(th3)*cosd(-90) sind(th3)*sind(-90) 0;sind(th3) cosd(th3)*cosd(-90) -cosd(th3)*sind(-90) 0;0 sind(-90) cosd(-90) 0.42;0 0 0 1];
T34 = [cosd(th4) -sind(th4)*cosd(90) sind(th4)*sind(90) 0;sind(th4) cosd(th4)*cosd(90) -cosd(th4)*sind(90) 0;0 sind(90) cosd(90) 0;0 0 0 1];
T45 = [cosd(th5) -sind(th5)*cosd(90) sind(th5)*sind(90) 0;sind(th5) cosd(th5)*cosd(90) -cosd(th5)*sind(90) 0;0 sind(90) cosd(90) 0.40;0 0 0 1];
T56 = [cosd(th6) -sind(th6)*cosd(-90) sind(th6)*sind(-90) 0;sind(th6) cosd(th6)*cosd(-90) -cosd(th6)*sind(-90) 0;0 sind(-90) cosd(-90) 0;0 0 0 1];
T67 = [cosd(th7) -sind(th7)*cosd(0) sind(th7)*sind(0) 0;sind(th7) cosd(th7)*cosd(0) -cosd(th7)*sind(0) 0;0 sind(0) cosd(0) 0;0 0 0 1];

%Transformation matrices from base coordinate frames to every other link
T01c = T01*a2c
T02 = T01*T12
T02c = T02*a3c
T03 = T02*T23
T03c = T03*a4c
T04 = T03*T34
T04c = T04*a5c
T05 = T04*T45
T05c = T05*a6c
T06 = T05*T56
T06c = T06*a7c
T07 = T06*T67

%Rotation Matrices 
R01 = [cosd(th1) -sind(th1)*cosd(90) sind(th1)*sind(90);sind(th1) cosd(th1)*cosd(90) -cosd(th1)*sind(90);0 sind(90) cosd(90)]
R12 = [cosd(th2) -sind(th2)*cosd(-90) sind(th2)*sind(-90);sind(th2) cosd(th2)*cosd(-90) -cosd(th2)*sind(-90);0 sind(-90) cosd(-90)]
R23 = [cosd(th3) -sind(th3)*cosd(-90) sind(th3)*sind(-90);sind(th3) cosd(th3)*cosd(-90) -cosd(th3)*sind(-90);0 sind(-90) cosd(-90)]
R34 = [cosd(th4) -sind(th4)*cosd(90) sind(th4)*sind(90);sind(th4) cosd(th4)*cosd(90) -cosd(th4)*sind(90);0 sind(90) cosd(90)]
R45 = [cosd(th5) -sind(th5)*cosd(90) sind(th5)*sind(90);sind(th5) cosd(th5)*cosd(90) -cosd(th5)*sind(90);0 sind(90) cosd(90)]
R56 = [cosd(th6) -sind(th6)*cosd(-90) sind(th6)*sind(-90);sind(th6) cosd(th6)*cosd(-90) -cosd(th6)*sind(-90);0 sind(-90) cosd(-90)]
R67 = [cosd(th7) -sind(th7)*cosd(0) sind(th7)*sind(0);sind(th7) cosd(th7)*cosd(0) -cosd(th7)*sind(0);0 sind(0) cosd(0)]

%Translational components
o01 = T01(1:3,4)
o01c = a1c(1:3)
o02 = T02(1:3,4)
o02c = T01c(1:3)
o03 = T03(1:3,4)
o03c = T02c(1:3)
o04 = T04(1:3,4)
o04c = T03c(1:3)
o05 = T05(1:3,4)
o05c = T04c(1:3)
o06 = T06(1:3,4)
o06c = T05c(1:3)
o07 = T07(1:3,4)
o07c = T06c(1:3)

%Computing R00 R01 R02 R03 R04 R05 R06 R07
R00 = [1 0 0;0 1 0;0 0 1];
R02 = (R01*R12)
R03 = (R02*R23)
R04 = (R03*R34)
R05 = (R04*R45)
R06 = (R05*R56)
R07 = (R06*R67)


%Jacobian Matrices 
%For link 1
z10 = R00*[0;0;1]
z11 = [0;0;0]
z12 = [0;0;0]
z13 = [0;0;0]
z14 = [0;0;0]
z15 = [0;0;0]
z16 = [0;0;0]

Jv1 = [cross(z10,(o01c)) z11 z12 z13 z14 z15 z16]
Jw1 = [z10 z11 z12 z13 z14 z15 z16]

%For link 2
z20 = R00*[0;0;1]
z21 = R01*[0;0;1]
z22 = [0;0;0]
z23 = [0;0;0]
z24 = [0;0;0]
z25 = [0;0;0]
z26 = [0;0;0]

Jv2 = [cross(z20,(o02c)) cross(z21,(o02c)-o01) z22 z23 z24 z25 z26]
Jw2 = [z20 z21 z22 z23 z24 z25 z26]

%For link 3
z30 = R00*[0;0;1]
z31 = R01*[0;0;1]
z32 = R02*[0;0;1]
z33 = [0;0;0]
z34 = [0;0;0]
z35 = [0;0;0]
z36 = [0;0;0]

Jv3 = [cross(z30,(o03c)) cross(z31,(o03c)-o01) cross(z32,(o03c)-o02) z33 z34 z35 z36]
Jw3 = [z30 z31 z32 z33 z34 z35 z36]

%For link 4
z40 = R00*[0;0;1]
z41 = R01*[0;0;1]
z42 = R02*[0;0;1]
z43 = R03*[0;0;1]
z44 = [0;0;0]
z45 = [0;0;0]
z46 = [0;0;0]

Jv4 = [cross(z40,(o04c)) cross(z41,(o04c)-o01) cross(z42,(o04c)-o02) cross(z43,(o04c)-o03) z44 z45 z46]
Jw4 = [z40 z41 z42 z43 z44 z45 z46]

%For link 5
z50 = R00*[0;0;1]
z51 = R01*[0;0;1]
z52 = R02*[0;0;1]
z53 = R03*[0;0;1]
z54 = R04*[0;0;1]
z55 = [0;0;0]
z56 = [0;0;0]

Jv5 = [cross(z50,(o05c)) cross(z51,(o05c)-o01) cross(z52,(o05c)-o02) cross(z53,(o05c)-o03) cross(z54,(o05c)-o04) z55 z56]
Jw5 = [z50 z51 z52 z53 z54 z55 z56]

%For link 6
z60 = R00*[0;0;1]
z61 = R01*[0;0;1]
z62 = R02*[0;0;1]
z63 = R03*[0;0;1]
z64 = R04*[0;0;1]
z65 = R05*[0;0;1]
z66 = [0;0;0]

Jv6 = [cross(z60,(o06c)) cross(z61,(o06c)-o01) cross(z62,(o06c)-o02) cross(z63,(o06c)-o03) cross(z64,(o06c)-o04) cross(z65,(o06c)-o05) z66]
Jw6 = [z60 z61 z62 z63 z64 z65 z66]

%For link 7
z70 = R00*[0;0;1]
z71 = R01*[0;0;1]
z72 = R02*[0;0;1]
z73 = R03*[0;0;1]
z74 = R04*[0;0;1]
z75 = R05*[0;0;1]
z76 = R06*[0;0;1]

Jv7 = [cross(z70,o07c) cross(z71,(o07c)-o01) cross(z72,(o07c)-o02) cross(z73,(o07c)-o03) cross(z74,(o07c)-o04) cross(z75,(o07c)-o05) cross(z76,(o07c)-o06)]
Jw7 = [z70 z71 z72 z73 z74 z75 z76]

%Translational Kinetic Energy for the KUKA LBR iiwa 
Kinetic_Translational = (m1*transpose(Jv1)*Jv1 + m2*transpose(Jv2)*Jv2 + m3*transpose(Jv3)*Jv3 + m4*transpose(Jv4)*Jv4 + m5*transpose(Jv5)*Jv5 + m6*transpose(Jv6)*Jv6 + m7*transpose(Jv7)*Jv7)

%Rotational Kinetic Energy for the KUKA LBR iiwa
Kinetic_Rotational = (transpose(Jw1)*R01*I1*transpose(R01)*Jw1 + transpose(Jw2)*R02*I2*transpose(R02)*Jw2 + transpose(Jw3)*R03*I3*transpose(R03)*Jw3 + transpose(Jw4)*R04*I4*transpose(R04)*Jw4 + transpose(Jw5)*R05*I5*transpose(R05)*Jw5 + transpose(Jw6)*R06*I6*transpose(R06)*Jw6 + transpose(Jw7)*R07*I7*transpose(R07)*Jw7)

%Mass matrix
Dq = (Kinetic_Translational + Kinetic_Rotational)

%%Cariolis Matrix
q = sym('th' , [1 7]);
qdot = [0 0 0.5 0 0 0 0];
c = sym(zeros(7));
for k = 1:7
    for j = 1:7
        for i = 1:7 
            c(k,j) = c(k,j) + ((diff(Dq(k,j),q(i)) + diff(Dq(k,i),q(j)) - diff(Dq(i,j),q(k)))/2)*qdot(i);
        end
    end
end

%%Gravity Matrix(Potential energies)

g = [0 0 -9.81]
P1 = m1*(g)*(o01c)
P2 = m2*(g)*(o02c)
P3 = m3*(g)*(o03c)
P4 = m4*(g)*(o04c)
P5 = m5*(g)*(o05c)
P6 = m6*(g)*(o06c)
P7 = m7*(g)*(o07c)

P = P1+P2+P3+P4+P5+P6+P7;

gq = [diff(P,th1);diff(P,th2);diff(P,th3);diff(P,th4);diff(P,th5);diff(P,th6);diff(P,th7)]

%Simplified Mass Matrix
Dq = subs(Dq, {th1 th2 th3 th4 th5 th6 th7}, {0 0 0 0 0 0 0})
Dq =vpa(Dq, 4)

%Simplified Cariolis Matrix
c = subs(c, {th1 th2 th3 th4 th5 th6 th7}, {0 0 0 0 0 0 0})
vpa(c,4)
cariolis = c*qdot'
coriolis = vpa(coriolis,4)

%the gravity matrix
gq = subs(gq, {th1 th2 th3 th4 th5 th6 th7}, {0 0 0 0 0 0 0})
G = vpa(gq,4)